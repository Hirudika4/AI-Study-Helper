#app.cl.jac

import from react { useState }
import from "@jac-client/utils" { Router, Routes, Route, Link }


def Block(props: any) -> any {
    return <div 
    onClick={props.onClick}
    style={{
        "background": (props.bgColor if props.bgColor else "linear-gradient(180deg, #dbeafe 0%, #bfdbfe 100%)"),
        "border": "none",
        "borderRadius": "20px",
        "padding": "24px",
        "minHeight": "320px",
        "boxShadow": "0 4px 20px rgba(0,0,0,0.08)",
        "display": "flex",
        "flexDirection": "column",
        "transition": "transform 0.3s ease, box-shadow 0.3s ease",
        "cursor": "pointer"
    }}
    onMouseEnter={lambda e: any -> None {
        e.currentTarget.style.transform = "translateY(-6px)";
        e.currentTarget.style.boxShadow = "0 12px 32px rgba(0,0,0,0.12)";
    }}
    onMouseLeave={lambda e: any -> None {
        e.currentTarget.style.transform = "translateY(0)";
        e.currentTarget.style.boxShadow = "0 4px 20px rgba(0,0,0,0.08)";
    }}>
        <div style={{
            "display": "flex",
            "alignItems": "center",
            "gap": "10px",
            "marginBottom": "8px"
        }}>
            <div style={{
                "width": "14px",
                "height": "14px",
                "borderRadius": "50%",
                "background": (props.dotColor if props.dotColor else "#3b82f6"),
                "boxShadow": "0 0 8px " + (props.dotColor if props.dotColor else "#3b82f6") + "80"
            }}></div>
            <h2 style={{
                "margin": "0",
                "fontSize": "20px",
                "fontWeight": "700",
                "color": (props.titleColor if props.titleColor else "#1e293b")
            }}>
                {props.title}
            </h2>
        </div>

        <div style={{
            "fontSize": "14px",
            "color": (props.subtitleColor if props.subtitleColor else "#64748b"),
            "marginBottom": "16px"
        }}>
            {props.subtitle}
        </div>

        <div style={{
            "fontSize": "14px",
            "color": "#334155",
            "whiteSpace": "pre-wrap",
            "overflowY": "auto",
            "maxHeight": "280px",
            "padding": "16px 18px",
            "borderRadius": "14px",
            "background": (props.contentBg if props.contentBg else "rgba(255,255,255,0.85)"),
            "flex": 1,
            "lineHeight": "1.6"
        }}>
            {props.content or props.placeholder or "Content will appear here after generation."}
        </div>
    </div>;
}



def RenderQuizCard(props: any) -> any {
    return <div 
    onClick={props.onClick}
    style={{
        "background": "linear-gradient(180deg, #fce7f3 0%, #fbcfe8 50%, #f9a8d4 100%)",
        "border": "none",
        "borderRadius": "20px",
        "padding": "24px",
        "minHeight": "320px",
        "boxShadow": "0 4px 20px rgba(236,72,153,0.15)",
        "display": "flex",
        "flexDirection": "column",
        "transition": "transform 0.3s ease, box-shadow 0.3s ease",
        "cursor": "pointer"
    }}
    onMouseEnter={lambda e: any -> None {
        e.currentTarget.style.transform = "translateY(-6px)";
        e.currentTarget.style.boxShadow = "0 12px 32px rgba(236,72,153,0.25)";
    }}
    onMouseLeave={lambda e: any -> None {
        e.currentTarget.style.transform = "translateY(0)";
        e.currentTarget.style.boxShadow = "0 4px 20px rgba(236,72,153,0.15)";
    }}>
        <div style={{
            "display": "flex",
            "alignItems": "center",
            "gap": "10px",
            "marginBottom": "8px"
        }}>
            <div style={{
                "width": "14px",
                "height": "14px",
                "borderRadius": "50%",
                "background": "#ec4899",
                "boxShadow": "0 0 10px rgba(236,72,153,0.6)"
            }}></div>
            <h2 style={{
                "margin": "0",
                "fontSize": "20px",
                "fontWeight": "700",
                "color": "#be185d"
            }}>
                Quiz
            </h2>
        </div>

        <div style={{
            "fontSize": "14px",
            "color": "#db2777",
            "marginBottom": "16px"
        }}>
            Multiple-choice questions from the passage.
        </div>

        <div style={{
            "fontSize": "14px",
            "color": "#334155",
            "whiteSpace": "pre-wrap",
            "overflowY": "auto",
            "maxHeight": "140px",
            "marginBottom": "16px",
            "padding": "16px 18px",
            "borderRadius": "14px",
            "background": "rgba(255,255,255,0.9)",
            "flex": 1,
            "lineHeight": "1.6"
        }}>
            {props.quizText or "Ask for a quiz in your prompt to see MCQs here."}
        </div>

        # RADIO BUTTONS – only visible when quizText has content
        <div style={{
            "marginTop": "4px",
            "display": ("flex" if props.quizText and props.quizText.trim() else "none"),
            "flexDirection": "column",
            "gap": "6px",
            "fontSize": "13px",
            "color": "#0f172a"
        }}>
            <label style={{
                "display": "flex",
                "alignItems": "center",
                "gap": "6px",
                "cursor": "pointer"
            }}>
                <input
                    type="radio"
                    name="quiz-option"
                    value="1"
                    checked={props.quizAnswer == "1"}
                    onChange={lambda e: any -> None {
                        props.setQuizAnswer("1");
                        props.onSubmitQuiz("1");
                    }}
                    style={{ "cursor": "pointer" }}
                />
                <span>Option 1</span>
            </label>

            <label style={{
                "display": "flex",
                "alignItems": "center",
                "gap": "6px",
                "cursor": "pointer"
            }}>
                <input
                    type="radio"
                    name="quiz-option"
                    value="2"
                    checked={props.quizAnswer == "2"}
                    onChange={lambda e: any -> None {
                        props.setQuizAnswer("2");
                        props.onSubmitQuiz("2");
                    }}
                    style={{ "cursor": "pointer" }}
                />
                <span>Option 2</span>
            </label>

            <label style={{
                "display": "flex",
                "alignItems": "center",
                "gap": "6px",
                "cursor": "pointer"
            }}>
                <input
                    type="radio"
                    name="quiz-option"
                    value="3"
                    checked={props.quizAnswer == "3"}
                    onChange={lambda e: any -> None {
                        props.setQuizAnswer("3");
                        props.onSubmitQuiz("3");
                    }}
                    style={{ "cursor": "pointer" }}
                />
                <span>Option 3</span>
            </label>

            <label style={{
                "display": "flex",
                "alignItems": "center",
                "gap": "6px",
                "cursor": "pointer"
            }}>
                <input
                    type="radio"
                    name="quiz-option"
                    value="4"
                    checked={props.quizAnswer == "4"}
                    onChange={lambda e: any -> None {
                        props.setQuizAnswer("4");
                        props.onSubmitQuiz("4");
                    }}
                    style={{ "cursor": "pointer" }}
                />
                <span>Option 4</span>
            </label>
        </div>
    
        # <div style={{
        #     "display": "flex",
        #     "gap": "10px",
        #     "alignItems": "center",
        #     "marginBottom": "12px"
        # }}>
        #     <input
        #         value={props.quizAnswer}
        #         onChange={lambda e: any -> None {
        #             props.setQuizAnswer(e.target.value);
        #         }}
        #         onClick={lambda e: any -> None {
        #             e.stopPropagation();
        #         }}
        #         placeholder="Type your answer..."
        #         style={{
        #             "flex": "1",
        #             "padding": "12px 16px",
        #             "borderRadius": "12px",
        #             "border": "none",
        #             "background": "#ffffff",
        #             "color": "#1e293b",
        #             "fontSize": "14px",
        #             "outline": "none"
        #         }}
        #     />
            # <button
            #     onClick={lambda e: any -> None {
            #         e.stopPropagation();
            #         props.onSubmitQuiz();
            #     }}
            #     style={{
            #         "padding": "12px 24px",
            #         "borderRadius": "12px",
            #         "border": "none",
            #         "background": "linear-gradient(135deg, #ec4899 0%, #db2777 100%)",
            #         "color": "#ffffff",
            #         "fontWeight": "600",
            #         "fontSize": "14px",
            #         "cursor": "pointer",
            #         "transition": "all 0.2s"
            #     }}
            #     onMouseEnter={lambda e: any -> None {
            #         e.target.style.transform = "scale(1.05)";
            #     }}
            #     onMouseLeave={lambda e: any -> None {
            #         e.target.style.transform = "scale(1)";
            #     }}
            # >
            #     Submit
            # </button>
        # </div>

        <div style={{
            "fontSize": "13px",
            "color": "#1e293b",
            "minHeight": "20px",
            "marginBottom": "10px"
        }}>
            {props.quizFeedback}
        </div>

        <div style={{
            "padding": "12px 16px",
            "borderRadius": "12px",
            "background": "rgba(255,255,255,0.85)",
            "fontSize": "14px",
            "color": "#334155",
            "marginBottom": "16px"
        }}>
            <strong style={{"color": "#be185d"}}>Student level:</strong> {props.studentLevel or "Not calculated yet"}
        </div>

        <div style={{
            "display": "flex",
            "justifyContent": "center"
        }}>
            <button
                onClick={lambda e: any -> None {
                    e.stopPropagation();
                    props.onNextQuestion();
                }}
                style={{
                    "padding": "14px 48px",
                    "borderRadius": "14px",
                    "border": "none",
                    "background": "linear-gradient(135deg, #ec4899 0%, #db2777 100%)",
                    "color": "#ffffff",
                    "fontWeight": "700",
                    "fontSize": "15px",
                    "cursor": "pointer",
                    "boxShadow": "0 4px 16px rgba(236,72,153,0.35)",
                    "transition": "all 0.2s"
                }}
                onMouseEnter={lambda e: any -> None {
                    e.target.style.transform = "scale(1.05)";
                    e.target.style.boxShadow = "0 6px 20px rgba(236,72,153,0.45)";
                }}
                onMouseLeave={lambda e: any -> None {
                    e.target.style.transform = "scale(1)";
                    e.target.style.boxShadow = "0 4px 16px rgba(236,72,153,0.35)";
                }}
            >
                Next Question
            </button>
        </div>
    </div>;
}



def RenderQuizCardExpanded(props: any) -> any {
    return <div style={{
        "background": "linear-gradient(180deg, #fce7f3 0%, #fbcfe8 50%, #f9a8d4 100%)",
        "border": "none",
        "borderRadius": "24px",
        "padding": "40px",
        "width": "90vw",
        "maxWidth": "900px",
        "minHeight": "500px",
        "maxHeight": "85vh",
        "boxShadow": "0 25px 50px rgba(236,72,153,0.25)",
        "display": "flex",
        "flexDirection": "column",
        "overflowY": "auto"
    }}>
        <div style={{
            "display": "flex",
            "alignItems": "center",
            "justifyContent": "space-between",
            "marginBottom": "16px"
        }}>
            <div style={{
                "display": "flex",
                "alignItems": "center",
                "gap": "12px"
            }}>
                <div style={{
                    "width": "16px",
                    "height": "16px",
                    "borderRadius": "50%",
                    "background": "#ec4899",
                    "boxShadow": "0 0 12px rgba(236,72,153,0.6)"
                }}></div>
                <h2 style={{
                    "margin": "0",
                    "fontSize": "28px",
                    "fontWeight": "700",
                    "color": "#be185d"
                }}>
                    Quiz
                </h2>
            </div>
            <button
                onClick={props.onClose}
                style={{
                    "padding": "10px 20px",
                    "borderRadius": "10px",
                    "border": "none",
                    "background": "#ef4444",
                    "color": "#ffffff",
                    "fontWeight": "600",
                    "fontSize": "14px",
                    "cursor": "pointer",
                    "transition": "all 0.2s"
                }}
                onMouseEnter={lambda e: any -> None {
                    e.target.style.background = "#dc2626";
                }}
                onMouseLeave={lambda e: any -> None {
                    e.target.style.background = "#ef4444";
                }}
            >
                Close
            </button>
        </div>

        <div style={{
            "fontSize": "15px",
            "color": "#db2777",
            "marginBottom": "20px"
        }}>
            Multiple-choice questions from the passage.
        </div>

        <div style={{
            "fontSize": "16px",
            "color": "#334155",
            "whiteSpace": "pre-wrap",
            "overflowY": "auto",
            "marginBottom": "20px",
            "padding": "20px",
            "borderRadius": "16px",
            "background": "rgba(255,255,255,0.9)",
            "flex": 1,
            "lineHeight": "1.7",
            "minHeight": "200px"
        }}>
            {props.quizText or "Ask for a quiz in your prompt to see MCQs here."}
        </div>
         

            # RADIO BUTTONS – only visible when quizText has content
        <div style={{
            "marginTop": "4px",
            "display": ("flex" if props.quizText and props.quizText.trim() else "none"),
            "flexDirection": "column",
            "gap": "6px",
            "fontSize": "13px",
            "color": "#0f172a"
        }}>
            <label style={{
                "display": "flex",
                "alignItems": "center",
                "gap": "6px",
                "cursor": "pointer"
            }}>
                <input
                    type="radio"
                    name="quiz-option"
                    value="1"
                    checked={props.quizAnswer == "1"}
                    onChange={lambda e: any -> None {
                        props.setQuizAnswer("1");
                        props.onSubmitQuiz("1");
                    }}
                    style={{ "cursor": "pointer" }}
                />
                <span>Option 1</span>
            </label>

            <label style={{
                "display": "flex",
                "alignItems": "center",
                "gap": "6px",
                "cursor": "pointer"
            }}>
                <input
                    type="radio"
                    name="quiz-option"
                    value="2"
                    checked={props.quizAnswer == "2"}
                    onChange={lambda e: any -> None {
                        props.setQuizAnswer("2");
                        props.onSubmitQuiz("2");
                    }}
                    style={{ "cursor": "pointer" }}
                />
                <span>Option 2</span>
            </label>

            <label style={{
                "display": "flex",
                "alignItems": "center",
                "gap": "6px",
                "cursor": "pointer"
            }}>
                <input
                    type="radio"
                    name="quiz-option"
                    value="3"
                    checked={props.quizAnswer == "3"}
                    onChange={lambda e: any -> None {
                        props.setQuizAnswer("3");
                        props.onSubmitQuiz("3");
                    }}
                    style={{ "cursor": "pointer" }}
                />
                <span>Option 3</span>
            </label>

            <label style={{
                "display": "flex",
                "alignItems": "center",
                "gap": "6px",
                "cursor": "pointer"
            }}>
                <input
                    type="radio"
                    name="quiz-option"
                    value="4"
                    checked={props.quizAnswer == "4"}
                    onChange={lambda e: any -> None {
                        props.setQuizAnswer("4");
                        props.onSubmitQuiz("4");
                    }}
                    style={{ "cursor": "pointer" }}
                />
                <span>Option 4</span>
            </label>
        </div>

        <div style={{
            "fontSize": "15px",
            "color": "#1e293b",
            "minHeight": "24px",
            "marginBottom": "12px"
        }}>
            {props.quizFeedback}
        </div>

        <div style={{
            "padding": "14px 18px",
            "borderRadius": "12px",
            "background": "rgba(255,255,255,0.85)",
            "fontSize": "15px",
            "color": "#334155",
            "marginBottom": "20px"
        }}>
            <strong style={{"color": "#be185d"}}>Student level:</strong> {props.studentLevel or "Not calculated yet"}
        </div>

        <div style={{
            "display": "flex",
            "justifyContent": "center"
        }}>
            <button
                onClick={lambda e: any -> None {
                    props.onNextQuestion();
                }}
                style={{
                    "padding": "16px 56px",
                    "borderRadius": "14px",
                    "border": "none",
                    "background": "linear-gradient(135deg, #ec4899 0%, #db2777 100%)",
                    "color": "#ffffff",
                    "fontWeight": "700",
                    "fontSize": "17px",
                    "cursor": "pointer",
                    "boxShadow": "0 4px 20px rgba(236,72,153,0.35)",
                    "transition": "all 0.2s"
                }}
                onMouseEnter={lambda e: any -> None {
                    e.target.style.transform = "scale(1.05)";
                    e.target.style.boxShadow = "0 6px 24px rgba(236,72,153,0.45)";
                }}
                onMouseLeave={lambda e: any -> None {
                    e.target.style.transform = "scale(1)";
                    e.target.style.boxShadow = "0 4px 20px rgba(236,72,153,0.35)";
                }}
            >
                Next Question
            </button>
        </div>
    </div>;
}



def BlockExpanded(props: any) -> any {
    return <div style={{
        "background": (props.bgColor if props.bgColor else "linear-gradient(180deg, #dbeafe 0%, #bfdbfe 100%)"),
        "border": "none",
        "borderRadius": "24px",
        "padding": "40px",
        "width": "90vw",
        "maxWidth": "900px",
        "minHeight": "500px",
        "maxHeight": "85vh",
        "boxShadow": "0 25px 50px rgba(0,0,0,0.15)",
        "display": "flex",
        "flexDirection": "column",
        "overflowY": "auto"
    }}>
        <div style={{
            "display": "flex",
            "alignItems": "center",
            "justifyContent": "space-between",
            "marginBottom": "16px"
        }}>
            <div style={{
                "display": "flex",
                "alignItems": "center",
                "gap": "12px"
            }}>
                <div style={{
                    "width": "16px",
                    "height": "16px",
                    "borderRadius": "50%",
                    "background": (props.dotColor if props.dotColor else "#3b82f6"),
                    "boxShadow": "0 0 12px " + (props.dotColor if props.dotColor else "#3b82f6") + "80"
                }}></div>
                <h2 style={{
                    "margin": "0",
                    "fontSize": "28px",
                    "fontWeight": "700",
                    "color": (props.titleColor if props.titleColor else "#1e293b")
                }}>
                    {props.title}
                </h2>
            </div>
            <button
                onClick={props.onClose}
                style={{
                    "padding": "10px 20px",
                    "borderRadius": "10px",
                    "border": "none",
                    "background": "#ef4444",
                    "color": "#ffffff",
                    "fontWeight": "600",
                    "fontSize": "14px",
                    "cursor": "pointer",
                    "transition": "all 0.2s"
                }}
                onMouseEnter={lambda e: any -> None {
                    e.target.style.background = "#dc2626";
                }}
                onMouseLeave={lambda e: any -> None {
                    e.target.style.background = "#ef4444";
                }}
            >
                Close
            </button>
        </div>

        <div style={{
            "fontSize": "15px",
            "color": (props.subtitleColor if props.subtitleColor else "#64748b"),
            "marginBottom": "20px"
        }}>
            {props.subtitle}
        </div>

        <div style={{
            "fontSize": "16px",
            "color": "#334155",
            "whiteSpace": "pre-wrap",
            "overflowY": "auto",
            "padding": "20px",
            "borderRadius": "16px",
            "background": (props.contentBg if props.contentBg else "rgba(255,255,255,0.9)"),
            "flex": 1,
            "lineHeight": "1.7",
            "minHeight": "300px"
        }}>
            {props.content or "Content will appear here after generation."}
        </div>
    </div>;
}



def Modal(props: any) -> any {
    if not props.isOpen {
        return null;
    }
    
    return <div 
        onClick={props.onClose}
        style={{
            "position": "fixed",
            "top": "0",
            "left": "0",
            "right": "0",
            "bottom": "0",
            "background": "rgba(15, 23, 42, 0.5)",
            "backdropFilter": "blur(8px)",
            "display": "flex",
            "alignItems": "center",
            "justifyContent": "center",
            "zIndex": "1000",
            "padding": "20px"
        }}>
        <div 
            onClick={lambda e: any -> None { e.stopPropagation(); }}>
            {props.children}
        </div>
    </div>;
}



def StudyPage() -> any {

    let [inputText, setInputText] = useState("");
    let [quizText, setQuizText] = useState("");
    let [summaryText, setSummaryText] = useState("");
    let [explanationText, setExplanationText] = useState("");
    let [flashcardText, setFlashcardText] = useState("");
    let [isLoading, setIsLoading] = useState(False);

    let [quizAnswer, setQuizAnswer] = useState("");
    let [quizFeedback, setQuizFeedback] = useState("");
    let [studentLevel, setStudentLevel] = useState("");
    
    let [activeModal, setActiveModal] = useState(null);

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

        mainResult = root spawn task_manager(utterance=inputText);
        console.log("Main result from task_manager:", mainResult);

        explanationResult = null;
        if lowered.includes("explain") or lowered.includes("explanation") {
            explanationResult = root spawn explainationwalker(utterance=inputText);
        }

        allReports = [];

        if mainResult.reports {
            allReports = allReports.concat(mainResult.reports);
        }
        if explanationResult and explanationResult.reports {
            allReports = allReports.concat(explanationResult.reports);
        }

        console.log("Merged backend reports:", allReports);

        output_str = "";
        if allReports.length > 0 {
            last = allReports[allReports.length - 1];

            if typeof(last) == "string" {
                output_str = last;
            } elif last.response {
                output_str = last.response;
            } elif last.output {
                output_str = last.output;
            } else {
                output_str = JSON.stringify(last, null, 2);
            }
        } else {
            output_str = "No response from backend.";
        }

        console.log("Output str:", output_str);

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
            setExplanationText(output_str);
            setFlashcardText("");
        }
        else {
            setQuizText("");
            setSummaryText("");
            setExplanationText(output_str);
            setFlashcardText("");
        }

        setIsLoading(False);
    }

    
    async def handleQuizSubmit(optionValue: str) -> None {
        if not optionValue.trim() {
            setQuizFeedback("Please select an answer.");
            return;
        }

        # keep state in sync with last clicked option
        setQuizAnswer(optionValue);

        # send chosen option to backend walker
        result = root spawn quiz_answer_walker(user_answer=optionValue);
        console.log("Quiz answer result:", result);

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

        setQuizFeedback(feedback);

        # update student level
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
    }
    
    def closeModal() -> None {
        setActiveModal(null);
    }

    def handleNextQuestion() -> None {
        setQuizFeedback(""); 
        setQuizAnswer("");
        handleProcess();
    }

    return <div style={{
        "minHeight": "100vh",
        "padding": "0",
        "background": "linear-gradient(180deg, #dbeafe 0%, #eff6ff 15%, #f8fafc 35%, #ffffff 50%, #f8fafc 65%, #eff6ff 85%, #dbeafe 100%)",
        "color": "#0f172a",
        "fontFamily": "system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif",
        "display": "flex",
        "flexDirection": "column",
        "position": "relative"
    }}>
        # Top blue gradient overlay - stronger and more visible
        <div style={{
            "position": "absolute",
            "top": "0",
            "left": "0",
            "right": "0",
            "height": "450px",
            "background": "linear-gradient(180deg, rgba(147,197,253,0.7) 0%, rgba(191,219,254,0.6) 25%, rgba(219,234,254,0.4) 50%, rgba(239,246,255,0.2) 75%, transparent 100%)",
            "pointerEvents": "none",
            "zIndex": "0"
        }}></div>
        
        # Bottom blue gradient overlay - stronger and more visible
        <div style={{
            "position": "absolute",
            "bottom": "0",
            "left": "0",
            "right": "0",
            "height": "400px",
            "background": "linear-gradient(0deg, rgba(147,197,253,0.65) 0%, rgba(191,219,254,0.5) 25%, rgba(219,234,254,0.35) 50%, rgba(239,246,255,0.15) 75%, transparent 100%)",
            "pointerEvents": "none",
            "zIndex": "0"
        }}></div>
        
        # Navigation
        <nav style={{
            "display": "flex",
            "justifyContent": "center",
            "alignItems": "center",
            "padding": "20px 40px",
            "background": "rgba(255,255,255,0.7)",
            "backdropFilter": "blur(12px)",
            "borderBottom": "1px solid rgba(226,232,240,0.6)",
            "position": "relative",
            "zIndex": "10"
        }}>
            <div style={{
                "display": "flex",
                "gap": "40px",
                "alignItems": "center"
            }}>
                <Link to="/" style={{
                    "textDecoration": "none",
                    "color": "#475569",
                    "fontSize": "15px",
                    "fontWeight": "600",
                    "padding": "12px 24px",
                    "borderRadius": "12px",
                    "transition": "all 0.3s",
                    "letterSpacing": "0.5px"
                }}
                onMouseEnter={lambda e: any -> None {
                    e.target.style.background = "#2563eb";
                    e.target.style.color = "#ffffff";
                    e.target.style.transform = "translateY(-2px)";
                    e.target.style.boxShadow = "0 6px 20px rgba(37,99,235,0.3)";
                }}
                onMouseLeave={lambda e: any -> None {
                    e.target.style.background = "transparent";
                    e.target.style.color = "#475569";
                    e.target.style.transform = "translateY(0)";
                    e.target.style.boxShadow = "none";
                }}>
                    HOME
                </Link>
                <Link to="/study" style={{
                    "textDecoration": "none",
                    "color": "#ffffff",
                    "fontSize": "15px",
                    "fontWeight": "600",
                    "padding": "12px 24px",
                    "borderRadius": "12px",
                    "background": "#2563eb",
                    "transition": "all 0.3s",
                    "letterSpacing": "0.5px",
                    "boxShadow": "0 4px 14px rgba(37,99,235,0.3)"
                }}
                onMouseEnter={lambda e: any -> None {
                    e.target.style.transform = "translateY(-2px)";
                    e.target.style.boxShadow = "0 8px 24px rgba(37,99,235,0.4)";
                }}
                onMouseLeave={lambda e: any -> None {
                    e.target.style.transform = "translateY(0)";
                    e.target.style.boxShadow = "0 4px 14px rgba(37,99,235,0.3)";
                }}>
                    STUDY WORKSPACE
                </Link>
            </div>
        </nav>

        # Main content
        <div style={{
            "display": "flex",
            "justifyContent": "center",
            "flex": 1,
            "padding": "40px 24px 60px",
            "position": "relative",
            "zIndex": "1"
        }}>
            <div style={{
                "width": "100%",
                "maxWidth": "1400px",
                "background": "rgba(255,255,255,0.85)",
                "backdropFilter": "blur(16px)",
                "borderRadius": "24px",
                "border": "1px solid rgba(226,232,240,0.6)",
                "padding": "36px 40px",
                "boxShadow": "0 8px 32px rgba(15,23,42,0.06)"
            }}>
                # Title
                <h1 style={{
                    "margin": "0 0 10px 0",
                    "fontSize": "40px",
                    "fontWeight": "800",
                    "textAlign": "center",
                    "background": "linear-gradient(135deg, #2563eb, #3b82f6)",
                    "WebkitBackgroundClip": "text",
                    "WebkitTextFillColor": "transparent",
                    "fontStyle": "italic"
                }}>
                    NeuroNote AI 
                </h1>

                <div style={{
                    "marginBottom": "28px",
                    "fontSize": "15px",
                    "color": "#64748b",
                    "textAlign": "center"
                }}>
                    Type a passage and include a keyword: quiz, summarize, explain, or flashcards.
                </div>

                # Textarea
                <textarea
                    value={inputText}
                    onChange={lambda e: any -> None { setInputText(e.target.value); }}
                    placeholder="Paste your passage here and say what you want (for example: 'Summarize this...', 'Create a quiz...', 'Explain like I am 10...', 'Make flashcards...')."
                    style={{
                        "width": "100%",
                        "height": "160px",
                        "padding": "18px 22px",
                        "fontSize": "15px",
                        "lineHeight": "1.7",
                        "borderRadius": "16px",
                        "border": "1px solid #e2e8f0",
                        "background": "#ffffff",
                        "color": "#1e293b",
                        "resize": "vertical",
                        "marginBottom": "24px",
                        "outline": "none",
                        "transition": "all 0.3s"
                    }}
                    onFocus={lambda e: any -> None {
                        e.target.style.border = "2px solid #3b82f6";
                        e.target.style.boxShadow = "0 0 0 4px rgba(59,130,246,0.1)";
                    }}
                    onBlur={lambda e: any -> None {
                        e.target.style.border = "1px solid #e2e8f0";
                        e.target.style.boxShadow = "none";
                    }}
                ></textarea>

                # Generate button
                <div style={{ "textAlign": "center", "marginBottom": "32px" }}>
                    <button
                        onClick={lambda e: any -> None { handleProcess(); }}
                        style={{
                            "padding": "16px 64px",
                            "borderRadius": "14px",
                            "border": "none",
                            "background": "linear-gradient(135deg, #3b82f6 0%, #2563eb 100%)",
                            "color": "#ffffff",
                            "fontWeight": "700",
                            "fontSize": "16px",
                            "cursor": "pointer",
                            "boxShadow": "0 6px 20px rgba(59,130,246,0.35)",
                            "transition": "all 0.3s"
                        }}
                        onMouseEnter={lambda e: any -> None {
                            e.target.style.transform = "translateY(-3px)";
                            e.target.style.boxShadow = "0 10px 28px rgba(59,130,246,0.45)";
                        }}
                        onMouseLeave={lambda e: any -> None {
                            e.target.style.transform = "translateY(0)";
                            e.target.style.boxShadow = "0 6px 20px rgba(59,130,246,0.35)";
                        }}
                    >
                        { "Working..." if isLoading else "Generate" }
                    </button>
                </div>

                <div style={{
                    "textAlign": "center",
                    "marginBottom": "20px",
                    "fontSize": "14px",
                    "color": "#94a3b8"
                }}>
                    Click any card below to expand it
                </div>

                # Cards grid
                <div style={{
                    "display": "grid",
                    "gridTemplateColumns": "repeat(auto-fit, minmax(320px, 1fr))",
                    "gap": "24px"
                }}>
                    # Quiz Card - Pink/Magenta theme
                    <RenderQuizCard 
                        quizText={quizText}
                        quizFeedback={quizFeedback}
                        quizAnswer={quizAnswer}
                        setQuizAnswer={setQuizAnswer}
                        setQuizFeedback={setQuizFeedback}
                        onSubmitQuiz={handleQuizSubmit}
                        studentLevel={studentLevel}
                        onNextQuestion={handleNextQuestion}
                        onClick={lambda e: any -> None { setActiveModal("quiz"); }}
                    />
                    
                    # Summarize Card - Mint green theme
                    <Block
                        title="Summarize"
                        subtitle="Concise summary of key ideas."
                        content={summaryText}
                        placeholder="Ask for a summary in your prompt to see results here."
                        dotColor="#22c55e"
                        titleColor="#15803d"
                        subtitleColor="#22c55e"
                        bgColor="linear-gradient(180deg, #d1fae5 0%, #a7f3d0 50%, #6ee7b7 100%)"
                        contentBg="rgba(254,252,232,0.9)"
                        onClick={lambda e: any -> None { setActiveModal("summarize"); }}
                    />
                    
                    # Explain Card - Yellow/Amber theme
                    <Block
                        title="Explain"
                        subtitle="Step-by-step or simple explanation."
                        content={explanationText}
                        placeholder="Ask for an explanation in your prompt to see results here."
                        dotColor="#f97316"
                        titleColor="#c2410c"
                        subtitleColor="#ea580c"
                        bgColor="linear-gradient(180deg, #fef3c7 0%, #fde68a 50%, #fcd34d 100%)"
                        contentBg="rgba(255,254,245,0.9)"
                        onClick={lambda e: any -> None { setActiveModal("explain"); }}
                    />
                    
                    # Flashcards Card - Purple/Lavender theme
                    <Block
                        title="Flashcards"
                        subtitle="Q&A style cards for studying."
                        content={flashcardText}
                        placeholder="Ask for flashcards in your prompt to see results here."
                        dotColor="#8b5cf6"
                        titleColor="#7c3aed"
                        subtitleColor="#a855f7"
                        bgColor="linear-gradient(180deg, #ede9fe 0%, #ddd6fe 50%, #c4b5fd 100%)"
                        contentBg="rgba(250,245,255,0.9)"
                        onClick={lambda e: any -> None { setActiveModal("flashcards"); }}
                    />
                </div>
            </div>
        </div>
        
        # Modals
        <Modal isOpen={activeModal == "quiz"} onClose={closeModal}>
            <RenderQuizCardExpanded
                quizText={quizText}
                quizFeedback={quizFeedback}
                quizAnswer={quizAnswer}
                setQuizAnswer={setQuizAnswer}
                onSubmitQuiz={handleQuizSubmit}
                studentLevel={studentLevel}
                onNextQuestion={handleNextQuestion}
                onClose={closeModal}
            />
        </Modal>
        
        <Modal isOpen={activeModal == "summarize"} onClose={closeModal}>
            <BlockExpanded
                title="Summarize"
                subtitle="Concise summary of key ideas."
                content={summaryText}
                dotColor="#22c55e"
                titleColor="#15803d"
                subtitleColor="#22c55e"
                bgColor="linear-gradient(180deg, #d1fae5 0%, #a7f3d0 50%, #6ee7b7 100%)"
                contentBg="rgba(254,252,232,0.9)"
                onClose={closeModal}
            />
        </Modal>
        
        <Modal isOpen={activeModal == "explain"} onClose={closeModal}>
            <BlockExpanded
                title="Explain"
                subtitle="Step-by-step or simple explanation."
                content={explanationText}
                dotColor="#f97316"
                titleColor="#c2410c"
                subtitleColor="#ea580c"
                bgColor="linear-gradient(180deg, #fef3c7 0%, #fde68a 50%, #fcd34d 100%)"
                contentBg="rgba(255,254,245,0.9)"
                onClose={closeModal}
            />
        </Modal>
        
        <Modal isOpen={activeModal == "flashcards"} onClose={closeModal}>
            <BlockExpanded
                title="Flashcards"
                subtitle="Q&A style cards for studying."
                content={flashcardText}
                dotColor="#8b5cf6"
                titleColor="#7c3aed"
                subtitleColor="#a855f7"
                bgColor="linear-gradient(180deg, #ede9fe 0%, #ddd6fe 50%, #c4b5fd 100%)"
                contentBg="rgba(250,245,255,0.9)"
                onClose={closeModal}
            />
        </Modal>
    </div>;
}



def HomePage() -> any {
    return <div style={{
        "minHeight": "100vh",
        "display": "flex",
        "flexDirection": "column",
        "backgroundImage": "url('/static/assets/home_page_img.jpg')",
        "backgroundSize": "cover",
        "backgroundPosition": "center",
        "backgroundRepeat": "no-repeat",
        "position": "relative"
    }}>
        <nav style={{
            "display": "flex",
            "justifyContent": "center",
            "alignItems": "center",
            "padding": "20px 40px",
            "position": "relative",
            "zIndex": "10"
        }}>
            <div style={{
                "display": "flex",
                "gap": "40px",
                "alignItems": "center"
            }}>
                <Link to="/" style={{
                    "textDecoration": "none",
                    "color": "#ffffff",
                    "fontSize": "15px",
                    "fontWeight": "600",
                    "padding": "12px 24px",
                    "borderRadius": "12px",
                    "background": "#2563eb",
                    "transition": "all 0.3s",
                    "letterSpacing": "0.5px",
                    "boxShadow": "0 4px 14px rgba(37,99,235,0.3)"
                }}
                onMouseEnter={lambda e: any -> None {
                    e.target.style.transform = "translateY(-2px)";
                    e.target.style.boxShadow = "0 8px 24px rgba(37,99,235,0.45)";
                }}
                onMouseLeave={lambda e: any -> None {
                    e.target.style.transform = "translateY(0)";
                    e.target.style.boxShadow = "0 4px 14px rgba(37,99,235,0.3)";
                }}>
                    HOME
                </Link>
                <Link to="/study" style={{
                    "textDecoration": "none",
                    "color": "#1e293b",
                    "fontSize": "15px",
                    "fontWeight": "600",
                    "padding": "12px 24px",
                    "borderRadius": "12px",
                    "transition": "all 0.3s",
                    "letterSpacing": "0.5px"
                }}
                onMouseEnter={lambda e: any -> None {
                    e.target.style.background = "#2563eb";
                    e.target.style.color = "#ffffff";
                    e.target.style.transform = "translateY(-2px)";
                    e.target.style.boxShadow = "0 8px 24px rgba(37,99,235,0.35)";
                }}
                onMouseLeave={lambda e: any -> None {
                    e.target.style.background = "transparent";
                    e.target.style.color = "#1e293b";
                    e.target.style.transform = "translateY(0)";
                    e.target.style.boxShadow = "none";
                }}>
                    STUDY WORKSPACE
                </Link>
            </div>
        </nav>

        <div style={{
            "flex": 1,
            "display": "flex",
            "alignItems": "flex-start",
            "padding": "0px 60px 0 60px",
            "marginTop": "-40px", 
            "position": "relative",
            "zIndex": "10"
        }}>
            <div style={{
                "marginLeft": "auto",
                "maxWidth": "350px",
                "textAlign": "left"
            }}>
                <h1 style={{
                    "fontSize": "72px",
                    "marginBottom": "24px",
                    "color": "#2563eb",
                    "fontWeight": "700",
                    "letterSpacing": "0.01em",
                    "lineHeight": "1.1"
                }}>
                    NeuroNote AI <br />
                    <span style={{ "color": "#2563eb" }}></span>
                </h1>
                
                <h2 style={{
                    "fontSize": "22px",
                    "marginBottom": "12px",
                    "color": "#1e293b",
                    "fontWeight": "400",
                    "letterSpacing": "0.02em",
                    "lineHeight": "1.4"
                }}>
                    Enhance Your Learning Experience With an AI Assistant That Converts Your Notes Into Clear Summaries, Practice Quizzes, and Study Materials
                </h2>

                <p style={{
                    "fontSize": "15px",
                    "color": "#64748b",
                    "marginBottom": "32px",
                    "lineHeight": "1.8",
                    "maxWidth": "520px"
                }}>
                    Turn your notes into quizzes, summaries, explanations, and flashcards.
                </p>

                <Link to="/study">
                    <button style={{
                        "padding": "14px 40px",
                        "fontSize": "15px",
                        "fontWeight": "600",
                        "borderRadius": "999px",
                        "border": "none",
                        "color": "white",
                        "cursor": "pointer",
                        "background": "#2563eb",
                        "boxShadow": "0 4px 14px rgba(37,99,235,0.4)",
                        "transition": "all 0.3s"
                    }}
                    onMouseEnter={lambda e: any -> None {
                        e.target.style.background = "#1d4ed8";
                        e.target.style.transform = "translateY(-2px)";
                        e.target.style.boxShadow = "0 6px 20px rgba(37,99,235,0.5)";
                    }}
                    onMouseLeave={lambda e: any -> None {
                        e.target.style.background = "#2563eb";
                        e.target.style.transform = "translateY(0)";
                        e.target.style.boxShadow = "0 4px 14px rgba(37,99,235,0.4)";
                    }}>
                        Open Study Workspace
                    </button>
                </Link>
            </div>
        </div>
    </div>;
}



def app() -> any {
    return <Router>
        <Routes>
            <Route path="/" element={<HomePage />} />
            <Route path="/study" element={<StudyPage />} />
        </Routes>
    </Router>;
}