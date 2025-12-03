import from react { useState }

# Reusable block component for the 3 non-quiz panels
def Block(props: any) -> any {
    return <div style={{
        "background": "linear-gradient(135deg,#ffffff,#eef2ff)",
        "border": "1px solid #c7d2fe",
        "borderRadius": "18px",
        "padding": "18px 18px 16px 18px",
        "minHeight": "260px",
        "boxShadow": "0 14px 35px rgba(15,23,42,0.12)",
        "display": "flex",
        "flexDirection": "column"
    }}>
        <div style={{
            "display": "flex",
            "alignItems": "center",
            "gap": "8px",
            "marginBottom": "6px"
        }}>
            <div style={{
                "width": "10px",
                "height": "10px",
                "borderRadius": "999px",
                "background": (props.dotColor if props.dotColor else "#6366f1")
            }}></div>
            <h2 style={{
                "margin": "0",
                "fontSize": "16px",
                "fontWeight": "650",
                "letterSpacing": "0.01em",
                "color": "#0f172a"
            }}>
                {props.title}
            </h2>
        </div>

        <div style={{
            "fontSize": "13px",
            "color": "#6b7280",
            "marginBottom": "10px"
        }}>
            {props.subtitle}
        </div>

        <div style={{
            "fontSize": "14px",
            "color": "#020617",
            "whiteSpace": "pre-wrap",
            "overflowY": "auto",
            "maxHeight": "290px",
            "padding": "10px 12px",
            "borderRadius": "12px",
            "background": "rgba(255,255,255,0.85)",
            "border": "1px dashed #e5e7eb",
            "flex": 1
        }}>
            {props.content}
        </div>
    </div>;
}

def RenderQuizCard(props: any) -> any {
    return <div style={{
        "background": "linear-gradient(135deg,#eef2ff,#ecfeff)",
        "border": "1px solid #a5b4fc",
        "borderRadius": "18px",
        "padding": "18px 18px 14px 18px",
        "minHeight": "260px",
        "boxShadow": "0 14px 35px rgba(15,23,42,0.15)",
        "display": "flex",
        "flexDirection": "column"
    }}>
        <div style={{
            "display": "flex",
            "alignItems": "center",
            "gap": "8px",
            "marginBottom": "6px"
        }}>
            <div style={{
                "width": "10px",
                "height": "10px",
                "borderRadius": "999px",
                "background": "#fb7185"
            }}></div>
            <h2 style={{
                "margin": "0",
                "fontSize": "16px",
                "fontWeight": "650",
                "color": "#0f172a"
            }}>
                Quiz
            </h2>
        </div>

        <div style={{
            "fontSize": "13px",
            "color": "#6b7280",
            "marginBottom": "10px"
        }}>
            Multiple-choice questions from the passage.
        </div>

        <div style={{
            "fontSize": "14px",
            "color": "#020617",
            "whiteSpace": "pre-wrap",
            "overflowY": "auto",
            "maxHeight": "210px",
            "marginBottom": "12px",
            "padding": "10px 12px",
            "borderRadius": "12px",
            "background": "rgba(255,255,255,0.92)",
            "border": "1px dashed #e5e7eb",
            "flex": 1
        }}>
            {props.quizText or "Ask for a quiz in your prompt to see MCQs here."}
        </div>
    
        <div style={{
            "display": "flex",
            "gap": "10px",
            "alignItems": "center"
        }}>
            <input
                value={props.quizAnswer}
                onChange={lambda e: any -> None {
                    props.setQuizAnswer(e.target.value);
                }}
                placeholder="Type your answer ..."
                style={{
                    "flex": "1",
                    "padding": "8px 10px",
                    "borderRadius": "999px",
                    "border": "1px solid #c4b5fd",
                    "background": "rgba(255,255,255,0.9)",
                    "fontSize": "13px",
                    "outline": "none"
                }}
            />
            <button
                onClick={lambda e: any -> None {
                    props.onSubmitQuiz();
                }}
                style={{
                    "padding": "8px 18px",
                    "borderRadius": "999px",
                    "border": "1px solid #2563eb",
                    "background": "linear-gradient(135deg,#3b82f6,#6366f1)",
                    "color": "#ffffff",
                    "fontWeight": "600",
                    "fontSize": "13px",
                    "cursor": "pointer",
                    "boxShadow": "0 8px 20px rgba(37,99,235,0.45)"
                }}
            >
                Submit
            </button>
        </div>

        <div style={{
            "marginTop": "6px",
            "fontSize": "13px",
            "color": "#0f172a",
            "minHeight": "18px"
        }}>
            {props.quizFeedback}
        </div>

        # NEW: Student level display box
        <div style={{
            "marginTop": "8px",
            "padding": "8px 10px",
            "borderRadius": "10px",
            "border": "1px dashed #cbd5f5",
            "background": "rgba(239,246,255,0.8)",
            "fontSize": "13px",
            "color": "#1f2933"
        }}>
            <strong>Student level:</strong> {props.studentLevel or "Not calculated yet"}
        </div>
    </div>;
}

def app() -> any {

    let [inputText, setInputText] = useState("");
    let [quizText, setQuizText] = useState("");
    let [summaryText, setSummaryText] = useState("");
    let [explanationText, setExplanationText] = useState("");
    let [flashcardText, setFlashcardText] = useState("");
    let [isLoading, setIsLoading] = useState(False);

    # quiz answer box state
    let [quizAnswer, setQuizAnswer] = useState("");
    let [quizFeedback, setQuizFeedback] = useState("");

    # NEW: student level state
    let [studentLevel, setStudentLevel] = useState("");

    async def handleProcess() -> None {
        if not inputText.trim() {
            setQuizText("");
            setSummaryText("");
            setExplanationText("Please enter a passage and a request.");
            setFlashcardText("");
            return;
        }

        setIsLoading(True);
        setQuizFeedback("");

        lowered = inputText.toLowerCase();

        # --- always run task_manager (quiz / summarize / flashcards) ---
        mainResult = root spawn task_manager(utterance=inputText);
        console.log("Main result from task_manager:", mainResult);

        # --- optionally run explanationwalker when needed ---
        explanationResult = null;
        if lowered.includes("explain") or lowered.includes("explanation") {
            explanationResult = root spawn explainationwalker(utterance=inputText);
        }

        # --- collect reports from BOTH walkers ---
        allReports = [];

        if mainResult.reports {
            allReports = allReports.concat(mainResult.reports);
        }
        if explanationResult and explanationResult.reports {
            allReports = allReports.concat(explanationResult.reports);
        }

        console.log("Merged backend reports:", allReports);

        # --- choose a final string to display ---
        output_str = "";
        if allReports.length > 0 {
            last = allReports[allReports.length - 1];  # usually the explanation

            if typeof(last) == "string" {
                output_str = last;
            } elif last.response {
                # if your backend reports { "response": "..." }
                output_str = last.response;
            } elif last.output {
                output_str = last.output;
            } else {
                # fallback – stringify object
                output_str = JSON.stringify(last, null, 2);
            }
        } else {
            output_str = "No response from backend.";
        }

        console.log("Output str:", output_str);

        # --- route into correct card ---
        if lowered.includes("quiz") or lowered.includes("mcq") or lowered.includes("multiple choice") {
            setQuizText(output_str);
            setSummaryText("");
            setExplanationText("");
            setFlashcardText("");
        }
        elif lowered.includes("summarize") or lowered.includes("summary") {
            setQuizText("");
            setSummaryText(output_str);
            setExplanationText("");
            setFlashcardText("");
        }
        elif lowered.includes("flashcard") or lowered.includes("flash card") {
            setQuizText("");
            setSummaryText("");
            setExplanationText("");
            setFlashcardText(output_str);
        }
        elif lowered.includes("explain") or lowered.includes("explanation") {
            setQuizText("");
            setSummaryText("");
            setExplanationText(output_str);  # explanation card
            setFlashcardText("");
        }
        else {
            # default: treat as explanation-ish text
            setQuizText("");
            setSummaryText("");
            setExplanationText(output_str);
            setFlashcardText("");
        }

        setIsLoading(False);
    }

    async def handleQuizSubmit() -> None {
        # 1) Require an answer in the input
        if not quizAnswer.trim() {
            setQuizFeedback("Please type an answer before submit.");
            return;
        }

        # 2) Call backend walker to check answer
        #    (rename to quiz_answer_walker if that's your exact walker name)
        result = root spawn quiz_answer_walker(user_answer=quizAnswer);
        console.log("Quiz answer result:", result);

        # 3) Extract the feedback string from reports
        feedback = "No response from backend.";

        if result and result.reports and result.reports.length > 0 {
            last = result.reports[result.reports.length - 1];

            if typeof(last) == "string" {
                feedback = last;
            } elif last.response {
                feedback = last.response;
            } elif last.output {
                feedback = last.output;
            } else {
                feedback = JSON.stringify(last, null, 2);
            }
        }

        # 4) Show the message under the quiz card
        setQuizFeedback(feedback);

        # NEW: fetch updated student level from backend
        levelResult = root spawn levelwalker();
        console.log("Level walker result:", levelResult);

        levelStr = "";

        if levelResult and levelResult.reports and levelResult.reports.length > 0 {
            lastLevel = levelResult.reports[levelResult.reports.length - 1];

            if typeof(lastLevel) == "string" {
                levelStr = lastLevel;
            } elif lastLevel.level {
                levelStr = lastLevel.level;
            } elif lastLevel.response {
                levelStr = lastLevel.response;
            } elif lastLevel.output {
                levelStr = lastLevel.output;
            } else {
                levelStr = JSON.stringify(lastLevel, null, 2);
            }
        }

        if levelStr {
            setStudentLevel(levelStr);
        }

        # optional: clear the input
        # setQuizAnswer("");
    }

    return <div style={{
        "minHeight": "100vh",
        "padding": "32px 16px",
        "background": "radial-gradient(circle at top,#e0f2fe 0,#dbeafe 35%,#e5e7eb 100%)",
        "color": "#0f172a",
        "fontFamily": "system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif",
        "display": "flex",
        "justifyContent": "center"
    }}>
        <div style={{
            "width": "100%",
            "maxWidth": "1400px",
            "background": "rgba(255,255,255,0.9)",
            "backdropFilter": "blur(12px)",
            "borderRadius": "28px",
            "border": "1px solid rgba(191,219,254,0.9)",
            "padding": "26px 30px 28px 30px",
            "boxShadow": "0 22px 60px rgba(15,23,42,0.25)"
        }}>
            <h1 style={{
                "margin": "0 0 6px 0",
                "fontSize": "30px",
                "fontWeight": "750",
                "textAlign": "center",
                "color": "#1d4ed8",
                "letterSpacing": "0.03em"
            }}>
                AI Study Helper
            </h1>

            <div style={{
                "marginBottom": "20px",
                "fontSize": "13px",
                "color": "#4b5563",
                "textAlign": "center"
            }}>
                Type a passage and include a keyword: quiz, summarize, explain, or flashcards.
            </div>

            <textarea
                value={inputText}
                onChange={lambda e: any -> None { setInputText(e.target.value); }}
                placeholder="Paste your passage here and say what you want (for example: 'Summarize this...', 'Create a quiz...', 'Explain like I am 10...', 'Make flashcards...')."
                style={{
                    "width": "100%",
                    "height": "190px",
                    "padding": "14px 16px",
                    "fontSize": "14px",
                    "lineHeight": "1.5",
                    "borderRadius": "14px",
                    "border": "1px solid #c7d2fe",
                    "background": "rgba(255,255,255,0.95)",
                    "color": "#020617",
                    "resize": "vertical",
                    "marginBottom": "18px",
                    "boxShadow": "inset 0 0 0 1px rgba(148,163,184,0.25)"
                }}
            ></textarea>

            <div style={{ "textAlign": "center", "marginBottom": "24px" }}>
                <button
                    onClick={lambda e: any -> None { handleProcess(); }}
                    style={{
                        "padding": "11px 52px",
                        "borderRadius": "999px",
                        "border": "0",
                        "background": "linear-gradient(135deg,#2563eb,#4f46e5)",
                        "color": "#ffffff",
                        "fontWeight": "650",
                        "fontSize": "14px",
                        "cursor": "pointer",
                        "boxShadow": "0 12px 30px rgba(37,99,235,0.55)",
                        "letterSpacing": "0.03em"
                    }}
                >
                    { "Working..." if isLoading else "Click me" }
                </button>
            </div>

            <div style={{
                "display": "grid",
                "gridTemplateColumns": "repeat(auto-fit, minmax(320px, 1fr))",
                "gap": "22px"
            }}>
                <RenderQuizCard 
                    quizText={quizText}
                    quizFeedback={quizFeedback}
                    quizAnswer={quizAnswer}
                    setQuizAnswer={setQuizAnswer}
                    setQuizFeedback={setQuizFeedback}
                    onSubmitQuiz={handleQuizSubmit}
                    studentLevel={studentLevel}   # NEW
                />
                <Block
                    title="Summarize"
                    subtitle="Concise summary of key ideas."
                    content={summaryText}
                    dotColor="#22c55e"
                />
                <Block
                    title="Explain"
                    subtitle="Step-by-step or simple explanation."
                    content={explanationText}
                    dotColor="#f97316"
                />
                <Block
                    title="Flashcards"
                    subtitle="Q&A style cards for studying."
                    content={flashcardText}
                    dotColor="#ec4899"
                />
            </div>
        </div>
    </div>;
}