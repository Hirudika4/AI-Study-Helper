# AI-Study-Helper

AI Study Helper is a smart study companion built using Jac, walkers, and a modern React-style UI.

It transforms any text into structured study material using a system of specialized AI agents.

Instead of one big LLM responding to all queries, our system intelligently **classifies the user’s request** and routes it to the appropriate agent:

- **Quiz Agent** — generates MCQs and checks answers  
- **Summarizer Agent** — produces clean, concise summaries  
- **Explanation Agent** — gives step-by-step or simple explanations  
- **Flashcard Agent** — creates Q/A flashcards  
- **Task Manager** — identifies user intent and dispatches tasks  

The UI provides a dedicated **Study Workspace** and a **Homepage** with smooth navigation.

## ▶️ How to Run

1. **Install dependencies**

```bash
pip install jac-client
pip install byllm
```
2. **Export API Keys**

```bash
export GEMINI_API_KEY = "your api key here"
export TAVILY_API_KEY = "your api key here"
```

3. **Run the application**

```bash
jac serve app.jac
```

4. **Open your browser**

```bash
http://localhost:8000/page/app
```

## 🧠 System Architecture

![WhatsApp Image 2025-12-03 at 21 39 56_dfd1da09](https://github.com/user-attachments/assets/1e44ffb3-ce31-49b7-af5d-9d28320f51a2)

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

## 🧭 High-Level Architecture Overview
![WhatsApp Image 2025-12-03 at 21 40 10_f2f906b4](https://github.com/user-attachments/assets/5d556e79-2faa-4ad2-9fb6-29497b571985)



