import from byllm.lib { Model }
import time;
import from tavily { TavilyClient }
import os;   # <-- correct way

glob llm = Model(model_name="gemini/gemini-2.5-flash");
glob tavily_client = TavilyClient(api_key=os.getenv("TAVILY_API_KEY"));


#   DATA NODES

node student_level{
    has level: str = "";
    has percentage: float = 0;
    has full_score: int = 0;

    can execute with levelwalker entry {
        print("[Student Level Node Activated]");
        quizzes = [self-->(`?Quiz)];
        print(len(quizzes));

        # reset before recomputing
        self.full_score = 0;
        student_score = 0;

        for q in quizzes {
            # assume each quiz is worth 1 point max
            self.full_score += 1;
            student_score += q.score;
        }

        if self.full_score > 0 {
            self.percentage = (student_score * 100.0) / self.full_score;
        } else {
            self.percentage = 0;
        }

        print(self.full_score);
        print(self.percentage);

        if self.percentage >= 80 {
            self.level = "advanced";
        }
        elif self.percentage >= 50 {
            self.level = "intermediate";
        }
        else {
            self.level = "beginner";
        }
        print(f"Student level updated to: {self.level}");

        report self.level;
    }

}

# Quiz node: represents a single MCQ
node Quiz {
    has question: str = "";
    has options: str = "";         # e.g. "A) ...\nB) ...\nC) ...\nD) ..."
    has correct_answer: str = ""; 
    has score:int = 0; # e.g. "B" or "Option 2"
}

sem Quiz = "A single multiple-choice question (MCQ).";
sem Quiz.question = "Text of the MCQ question.";
sem Quiz.options = "All answer options in a formatted string, typically numbered or lettered.";
sem Quiz.correct_answer = "The correct option for this MCQ (e.g. 'B' or 'Option 3').";


node QuizHandling {
    # Tool: store a new quiz question
    def create_quiz(question: str, options: str, correct_answer: str) -> str {
        print(f"[Quiz Created]: {question}");
        quiz_created = Quiz(
            question=question,
            options=options,
            correct_answer=correct_answer
        );
        self ++> quiz_created;
        level_nodes = [root-->(`?student_level)];
        if level_nodes {
            level = level_nodes[0];
            level ++> quiz_created;
        }
        return "Quiz question added successfully";
    }

    def tavily_search(topic: str) -> str{
        print("Performing Tavily search for topic:", topic);
        search_results = tavily_client.search(topic, limit=3);
        snippets = [r["content"] for r in search_results.get("results", []) if "content" in r];
        str_results = "\n".join(snippets);
        return str_results;
    }
    
    def route_and_generate(utterance: str) -> str by llm(
        method = "ReAct",
        tools  = ([self.create_quiz,self.tavily_search])
    );

    can execute with task_manager entry {
        print("[QuizHandling Node Activated]");

        full_prompt = (
            visitor.cur_task.task + "\n\n"
            + "Here is the study text from the student:\n"
            + visitor.utterance
            + "\n\n"
            + "Create ONLY multiple-choice questions (MCQs) based on this passage.\n"
            + "- If the user asks for N questions, create exactly N questions.\n"
            +  "==================== STRICT FORMAT RULES ====================\n"
            + "- Each question must be in this exact format:\n"
            + "Question 1:\n"
            + "<question text>\n"
            + "1. option one\\n"
            + "2. option two\\n"
            + "3. option three\\n"
            + "4. option four\\n"
            + "Then continue with Question 2, Question 3, etc.\n"
            + "Do NOT add any extra explanation or commentary around the quiz and to create quiz please use web search tool when needed.\n"
        );

        # LLM decides how many questions to create
        response = self.route_and_generate(full_prompt);
        print("→", response);

        # gather all quiz nodes
        quizzes = [self-->(`?Quiz)];

        # quizzes = [Quiz(), Quiz(), Quiz()]
        if quizzes {
            quizzes = [quizzes[-1]];
        } else {
            quizzes = [];
        }
        print(f"[Total Quizzes Created: {len(quizzes)}]");

        # ---- build a nice string for the frontend ----
        quiz_text = "";
        idx = 1;
        for q in quizzes {
            quiz_text += f"{idx}. {q.question}\n\n";
            quiz_text += f"{q.options}\n\n";  # options already formatted string
            idx += 1;
        }

        # if somehow no quizzes, fall back to LLM response
        # if not quiz_text {
        #     quiz_text = response;
        # }
        print(quiz_text);

        # THIS is what React sees in result.reports
        report quiz_text;
    }
}


# Summarizer agent: summarizes text / documents
node SummarizerHandling {
    # Direct LLM call that does summarization
    def summarize_text(utterance: str) -> str by llm();

    can execute with task_manager entry {
        print("[SummarizerHandling Node Activated]");
        full_prompt  = ("\n\n"
            + "Here is the text to summarize:\n"
            + visitor.utterance
        );
        response = self.summarize_text(full_prompt);
        print("→", response);
        report response;
    }
}

#Explanation agent: provides simple and step-by-step explanations
node ExplanationHandling {
    """
    Agent responsible for giving simple explanations ("explain like I'm 10")
    and deeper, step-by-step breakdowns of a concept.
    """

    # Tool 1: very simple explanation, kid-friendly
    def explain_simple(utterance: str) -> str by llm();

    # Tool 2: detailed, step-by-step explanation
    def explain_step_by_step(utterance: str) -> str by llm();

    # ReAct-style router inside this agent: let the LLM decide
    # whether to answer simply, step-by-step, or both.
    def route_and_run(utterance: str) -> str by llm(
        method = "ReAct",
        tools  = ([self.explain_simple, self.explain_step_by_step])
    );

        
    # Hook into the same task_manager walker entry as your other agents
    can execute with explainationwalker entry {
        print("[ExplanationHandling Node Activated]");
        
        level_nodes = [root-->(`?student_level)];
        level_str = "beginner";
        if level_nodes {
            level_node = level_nodes[0];
            level_str = level_node.level;
        }

        # 2) Build a prompt that tells the LLM how to use tools based on level
        full_prompt  = (
            "You are an explanation agent with two tools:\n"
            "- explain_simple: short, concise explanation.\n"
            "- explain_step_by_step: detailed explanation broken into steps.\n\n"
            + "Student level: " + level_str + "\n"
            + "Use the tools as follows:\n"
            + "- If student level is 'beginner', prefer ONLY explain_step_by_step.\n"
            + "- If student level is 'intermediate', you may combine both, but include some step-by-step explanation.\n"
            + "- If student level is 'advanced', prefer ONLY explain_simple and avoid long step-by-step breakdowns.\n\n"
            + "Here is the concept to explain:\n"
            + visitor.utterance
        );


        response = self.route_and_run(full_prompt);
        print("→", response);
        report response;
    }
}



# Flashcard agent: creates flashcards from source text
node FlashcardHandling {
    def create_flashcards(source_text: str) -> str by llm();
    def route_and_run(utterance: str) -> str by llm(
        method = "ReAct",
        tools  = ([self.create_flashcards])
    );

    can execute with task_manager entry {
        print("[FlashcardHandling Node Activated]");
        full_prompt  = (visitor.cur_task.task + "\n\n"
            + "Here is the source text for flashcards:\n"
            + visitor.utterance
        );
        response = self.route_and_run(full_prompt);
        print("→", response);
        report response;
    }
}

#   ROUTING METADATA

enum RoutingNodes {
    QUIZ_HANDLING,
    SUMMARIZER_HANDLING,
    FLASHCARD_HANDLING,
    EXPLANATION_HANDLING
}

sem RoutingNodes.QUIZ_HANDLING = "Generate and manage multiple-choice quiz questions (MCQs) from the user's request or study material.";
sem RoutingNodes.SUMMARIZER_HANDLING = "Summarize user-provided text or documents into concise explanations or bullet points.";
sem RoutingNodes.FLASHCARD_HANDLING = "Create flashcards for study purposes based on the user's input or source text.";
sem RoutingNodes.EXPLANATION_HANDLING = "Provide simple or step-by-step explanations of concepts as requested by the user.";


obj TaskPartition {
    has task: str;
    has agent_type: RoutingNodes;
}

sem TaskPartition = "A sub-task derived from the user's main request.";
sem TaskPartition.task = "Natural language description of this sub-task (e.g., 'create 5 MCQs on photosynthesis').";
sem TaskPartition.agent_type = "Which specialized agent node (QuizHandling, SummarizerHandling,ExplanationHandling or FlashcardHandling) should process this sub-task.";

#   ORCHESTRATOR WALKER

walker task_manager {
    has utterance: str = "";
    has cur_task: TaskPartition = None;

    # (Optional) single-step router (kept for compatibility)
    def route_to_node(utterance: str) -> RoutingNodes by llm();

    # Planner that breaks the main utterance into TaskPartition subtasks
    def plan_tasks(main_task: str) -> list[TaskPartition] by llm();

    can execute with `root entry {
        # Ensure student_level node exists
        level_nodes = [root-->(`?student_level)];
        if not level_nodes {
            print("No student_level node found. Creating one...");
            root ++> student_level(level="beginner");
        }

        # Use whatever utterance was set on the walker
        subtasks = self.plan_tasks(self.utterance);

        print("[Planned Subtasks]:", subtasks);

        node_map = {
            RoutingNodes.QUIZ_HANDLING: QuizHandling,
            RoutingNodes.SUMMARIZER_HANDLING: SummarizerHandling,
            RoutingNodes.FLASHCARD_HANDLING: FlashcardHandling,
            RoutingNodes.EXPLANATION_HANDLING: ExplanationHandling
        };

        # for subtask in subtasks {
        #     node_type = node_map[subtask.agent_type];
        #     routed_node = [-->(`?node_type)];          # node filtering
        #     if not routed_node {
        #         routed_node = here ++> node_type();
        #     }
        #     self.cur_task = subtask;
        #     #route = [-->(`?node_type)];
            
        #     route_quiz = [-->(`?ExplanationHandling)];
        #     if route_quiz{
        #         print("a1");
        #     }
        #     else{
        #         visit routed_node;
        #     }
        
        # }

        for subtask in subtasks {
            node_type = node_map[subtask.agent_type];

            # find or create the agent node
            routed_nodes = [-->(`?node_type)];
            if not routed_nodes {
                routed_nodes = [here ++> node_type()];
            }

            target = routed_nodes[0];
            self.cur_task = subtask;

            # *** IMPORTANT: always visit the routed node ***
            visit target;
        }

    }
}

walker explainationwalker{
    has utterance: str = "";

    can execute with `root entry {
        print("[Explanation Walker Activated]");
        route = [-->(`?ExplanationHandling)]; 
        print(route);
        if route{
            visit route;
        }
    }
}

walker levelwalker{
    can execute with `root entry {
        print("[Student Level Walker Activated]");
        route = [-->(`?student_level)]; 
        print(route);
        if route{
            visit route;
        }
    }
}


walker quiz_answer_walker {
    has user_answer: str = "";

    can execute with `root entry {
        print("[Quiz Answer Walker Activated]");
        visit [-->(`?QuizHandling)];
    }


    can report with QuizHandling entry {   
        # collect all Quiz nodes
        quizzes = [-->(`?Quiz)];
        print(quizzes);

        if not quizzes {
            report "No quiz available. Please generate a quiz first.";
        }
        else {
            # take the most recently created quiz
            q = quizzes[len(quizzes) - 1];

            user = self.user_answer.strip().lower();
            correct = q.correct_answer.strip().lower();

            msg = "";
            if user == correct {
                q.score += 1;
                msg = "Correct! 🎉";
            }
            else {
                msg = f"Incorrect. The correct answer is: {q.correct_answer}";
            }

            print(msg);
            report msg;
        }

        # Recalculate student level after this answer
        
    }
}



# with entry {
#     # Ask for the main user request in the terminal
#     #root ++> student_level(level="beginner");
#     utter = input("Enter your request: ");
#     root spawn task_manager(utterance = utter);
#     root spawn levelwalker();
#     root spawn explainationwalker(utterance = utter);
    
# }



    



    
    