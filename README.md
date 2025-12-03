# AI-Study-Helper

AI Study Helper is a smart study companion built using Jac, walkers, and a modern React-style UI.

It transforms any text into structured study material using a system of specialized AI agents.

Instead of one big LLM responding to all queries, our system intelligently classifies the user’s request and routes it to the appropriate agent:

Instead of one big LLM responding to all queries, our system intelligently **classifies the user’s request** and routes it to the appropriate agent:

- **Quiz Agent** — generates MCQs and checks answers  
- **Summarizer Agent** — produces clean, concise summaries  
- **Explanation Agent** — gives step-by-step or simple explanations  
- **Flashcard Agent** — creates Q/A flashcards  
- **Task Manager** — identifies user intent and dispatches tasks  

The UI provides a dedicated **Study Workspace** and a **Homepage** with smooth navigation.

## 🧠 System Architecture



## ✨ Key Features

### 🔹 1. System
Your request is automatically categorized and routed to specialized AI agents.

### 🔹 2. Dedicated Study Workspace
Four separate panels:

- Quiz
- Summarize
- Explain
- Flashcards  

Everything clean, instant, and focused.

### 🔹 3. Interactive Quizzes
- Generate MCQs
- Enter your answer
- System checks it via `quiz_answer_walker`
- Immediate feedback


