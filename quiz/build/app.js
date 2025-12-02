function _regenerator() { /*! regenerator-runtime -- Copyright (c) 2014-present, Facebook, Inc. -- license (MIT): https://github.com/babel/babel/blob/main/packages/babel-helpers/LICENSE */ var e, t, r = "function" == typeof Symbol ? Symbol : {}, n = r.iterator || "@@iterator", o = r.toStringTag || "@@toStringTag"; function i(r, n, o, i) { var c = n && n.prototype instanceof Generator ? n : Generator, u = Object.create(c.prototype); return _regeneratorDefine2(u, "_invoke", function (r, n, o) { var i, c, u, f = 0, p = o || [], y = !1, G = { p: 0, n: 0, v: e, a: d, f: d.bind(e, 4), d: function d(t, r) { return i = t, c = 0, u = e, G.n = r, a; } }; function d(r, n) { for (c = r, u = n, t = 0; !y && f && !o && t < p.length; t++) { var o, i = p[t], d = G.p, l = i[2]; r > 3 ? (o = l === n) && (u = i[(c = i[4]) ? 5 : (c = 3, 3)], i[4] = i[5] = e) : i[0] <= d && ((o = r < 2 && d < i[1]) ? (c = 0, G.v = n, G.n = i[1]) : d < l && (o = r < 3 || i[0] > n || n > l) && (i[4] = r, i[5] = n, G.n = l, c = 0)); } if (o || r > 1) return a; throw y = !0, n; } return function (o, p, l) { if (f > 1) throw TypeError("Generator is already running"); for (y && 1 === p && d(p, l), c = p, u = l; (t = c < 2 ? e : u) || !y;) { i || (c ? c < 3 ? (c > 1 && (G.n = -1), d(c, u)) : G.n = u : G.v = u); try { if (f = 2, i) { if (c || (o = "next"), t = i[o]) { if (!(t = t.call(i, u))) throw TypeError("iterator result is not an object"); if (!t.done) return t; u = t.value, c < 2 && (c = 0); } else 1 === c && (t = i["return"]) && t.call(i), c < 2 && (u = TypeError("The iterator does not provide a '" + o + "' method"), c = 1); i = e; } else if ((t = (y = G.n < 0) ? u : r.call(n, G)) !== a) break; } catch (t) { i = e, c = 1, u = t; } finally { f = 1; } } return { value: t, done: y }; }; }(r, o, i), !0), u; } var a = {}; function Generator() {} function GeneratorFunction() {} function GeneratorFunctionPrototype() {} t = Object.getPrototypeOf; var c = [][n] ? t(t([][n]())) : (_regeneratorDefine2(t = {}, n, function () { return this; }), t), u = GeneratorFunctionPrototype.prototype = Generator.prototype = Object.create(c); function f(e) { return Object.setPrototypeOf ? Object.setPrototypeOf(e, GeneratorFunctionPrototype) : (e.__proto__ = GeneratorFunctionPrototype, _regeneratorDefine2(e, o, "GeneratorFunction")), e.prototype = Object.create(u), e; } return GeneratorFunction.prototype = GeneratorFunctionPrototype, _regeneratorDefine2(u, "constructor", GeneratorFunctionPrototype), _regeneratorDefine2(GeneratorFunctionPrototype, "constructor", GeneratorFunction), GeneratorFunction.displayName = "GeneratorFunction", _regeneratorDefine2(GeneratorFunctionPrototype, o, "GeneratorFunction"), _regeneratorDefine2(u), _regeneratorDefine2(u, o, "Generator"), _regeneratorDefine2(u, n, function () { return this; }), _regeneratorDefine2(u, "toString", function () { return "[object Generator]"; }), (_regenerator = function _regenerator() { return { w: i, m: f }; })(); }
function _regeneratorDefine2(e, r, n, t) { var i = Object.defineProperty; try { i({}, "", {}); } catch (e) { i = 0; } _regeneratorDefine2 = function _regeneratorDefine(e, r, n, t) { function o(r, n) { _regeneratorDefine2(e, r, function (e) { return this._invoke(r, n, e); }); } r ? i ? i(e, r, { value: n, enumerable: !t, configurable: !t, writable: !t }) : e[r] = n : (o("next", 0), o("throw", 1), o("return", 2)); }, _regeneratorDefine2(e, r, n, t); }
function asyncGeneratorStep(n, t, e, r, o, a, c) { try { var i = n[a](c), u = i.value; } catch (n) { return void e(n); } i.done ? t(u) : Promise.resolve(u).then(r, o); }
function _asyncToGenerator(n) { return function () { var t = this, e = arguments; return new Promise(function (r, o) { var a = n.apply(t, e); function _next(n) { asyncGeneratorStep(a, r, o, _next, _throw, "next", n); } function _throw(n) { asyncGeneratorStep(a, r, o, _next, _throw, "throw", n); } _next(void 0); }); }; }
function _slicedToArray(r, e) { return _arrayWithHoles(r) || _iterableToArrayLimit(r, e) || _unsupportedIterableToArray(r, e) || _nonIterableRest(); }
function _nonIterableRest() { throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); }
function _unsupportedIterableToArray(r, a) { if (r) { if ("string" == typeof r) return _arrayLikeToArray(r, a); var t = {}.toString.call(r).slice(8, -1); return "Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t ? Array.from(r) : "Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t) ? _arrayLikeToArray(r, a) : void 0; } }
function _arrayLikeToArray(r, a) { (null == a || a > r.length) && (a = r.length); for (var e = 0, n = Array(a); e < a; e++) n[e] = r[e]; return n; }
function _iterableToArrayLimit(r, l) { var t = null == r ? null : "undefined" != typeof Symbol && r[Symbol.iterator] || r["@@iterator"]; if (null != t) { var e, n, i, u, a = [], f = !0, o = !1; try { if (i = (t = t.call(r)).next, 0 === l) { if (Object(t) !== t) return; f = !1; } else for (; !(f = (e = i.call(t)).done) && (a.push(e.value), a.length !== l); f = !0); } catch (r) { o = !0, n = r; } finally { try { if (!f && null != t["return"] && (u = t["return"](), Object(u) !== u)) return; } finally { if (o) throw n; } } return a; } }
function _arrayWithHoles(r) { if (Array.isArray(r)) return r; }
import { __jacJsx, __jacSpawn } from "@jac-client/utils";
import { useState } from "react";
function Block(props) {
  return __jacJsx("div", {
    "style": {
      "background": "linear-gradient(135deg,#ffffff,#eef2ff)",
      "border": "1px solid #c7d2fe",
      "borderRadius": "18px",
      "padding": "18px 18px 16px 18px",
      "minHeight": "260px",
      "boxShadow": "0 14px 35px rgba(15,23,42,0.12)",
      "display": "flex",
      "flexDirection": "column"
    }
  }, [__jacJsx("div", {
    "style": {
      "display": "flex",
      "alignItems": "center",
      "gap": "8px",
      "marginBottom": "6px"
    }
  }, [__jacJsx("div", {
    "style": {
      "width": "10px",
      "height": "10px",
      "borderRadius": "999px",
      "background": props.dotColor ? props.dotColor : "#6366f1"
    }
  }, []), __jacJsx("h2", {
    "style": {
      "margin": "0",
      "fontSize": "16px",
      "fontWeight": "650",
      "letterSpacing": "0.01em",
      "color": "#0f172a"
    }
  }, [props.title])]), __jacJsx("div", {
    "style": {
      "fontSize": "13px",
      "color": "#6b7280",
      "marginBottom": "10px"
    }
  }, [props.subtitle]), __jacJsx("div", {
    "style": {
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
    }
  }, [props.content])]);
}
function RenderQuizCard(props) {
  return __jacJsx("div", {
    "style": {
      "background": "linear-gradient(135deg,#eef2ff,#ecfeff)",
      "border": "1px solid #a5b4fc",
      "borderRadius": "18px",
      "padding": "18px 18px 14px 18px",
      "minHeight": "260px",
      "boxShadow": "0 14px 35px rgba(15,23,42,0.15)",
      "display": "flex",
      "flexDirection": "column"
    }
  }, [__jacJsx("div", {
    "style": {
      "display": "flex",
      "alignItems": "center",
      "gap": "8px",
      "marginBottom": "6px"
    }
  }, [__jacJsx("div", {
    "style": {
      "width": "10px",
      "height": "10px",
      "borderRadius": "999px",
      "background": "#fb7185"
    }
  }, []), __jacJsx("h2", {
    "style": {
      "margin": "0",
      "fontSize": "16px",
      "fontWeight": "650",
      "color": "#0f172a"
    }
  }, ["Quiz"])]), __jacJsx("div", {
    "style": {
      "fontSize": "13px",
      "color": "#6b7280",
      "marginBottom": "10px"
    }
  }, ["Multiple-choice questions from the passage."]), __jacJsx("div", {
    "style": {
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
    }
  }, [props.quizText || "Ask for a quiz in your prompt to see MCQs here."]), __jacJsx("div", {
    "style": {
      "display": "flex",
      "gap": "10px",
      "alignItems": "center"
    }
  }, [__jacJsx("input", {
    "value": props.quizAnswer,
    "onChange": function onChange(e) {
      props.setQuizAnswer(e.target.value);
    },
    "placeholder": "Type your answer ...",
    "style": {
      "flex": "1",
      "padding": "8px 10px",
      "borderRadius": "999px",
      "border": "1px solid #c4b5fd",
      "background": "rgba(255,255,255,0.9)",
      "fontSize": "13px",
      "outline": "none"
    }
  }, []), __jacJsx("button", {
    "onClick": function onClick(e) {
      if (!props.quizAnswer.trim()) {
        props.setQuizFeedback("Please type an answer before submitting.");
      } else {
        props.setQuizFeedback("Answer submitted! (You can wire backend checking later.)");
      }
    },
    "style": {
      "padding": "8px 18px",
      "borderRadius": "999px",
      "border": "1px solid #2563eb",
      "background": "linear-gradient(135deg,#3b82f6,#6366f1)",
      "color": "#ffffff",
      "fontWeight": "600",
      "fontSize": "13px",
      "cursor": "pointer",
      "boxShadow": "0 8px 20px rgba(37,99,235,0.45)"
    }
  }, ["Submit"])]), __jacJsx("div", {
    "style": {
      "marginTop": "6px",
      "fontSize": "13px",
      "color": "#0f172a",
      "minHeight": "18px"
    }
  }, [props.quizFeedback])]);
}
function app() {
  var _useState = useState(""),
    _useState2 = _slicedToArray(_useState, 2),
    inputText = _useState2[0],
    setInputText = _useState2[1];
  var _useState3 = useState(""),
    _useState4 = _slicedToArray(_useState3, 2),
    quizText = _useState4[0],
    setQuizText = _useState4[1];
  var _useState5 = useState(""),
    _useState6 = _slicedToArray(_useState5, 2),
    summaryText = _useState6[0],
    setSummaryText = _useState6[1];
  var _useState7 = useState(""),
    _useState8 = _slicedToArray(_useState7, 2),
    explanationText = _useState8[0],
    setExplanationText = _useState8[1];
  var _useState9 = useState(""),
    _useState0 = _slicedToArray(_useState9, 2),
    flashcardText = _useState0[0],
    setFlashcardText = _useState0[1];
  var _useState1 = useState(false),
    _useState10 = _slicedToArray(_useState1, 2),
    isLoading = _useState10[0],
    setIsLoading = _useState10[1];
  var _useState11 = useState(""),
    _useState12 = _slicedToArray(_useState11, 2),
    quizAnswer = _useState12[0],
    setQuizAnswer = _useState12[1];
  var _useState13 = useState(""),
    _useState14 = _slicedToArray(_useState13, 2),
    quizFeedback = _useState14[0],
    setQuizFeedback = _useState14[1];
  function handleProcess() {
    return _handleProcess.apply(this, arguments);
  }
  function _handleProcess() {
    _handleProcess = _asyncToGenerator(/*#__PURE__*/_regenerator().m(function _callee() {
      var lowered, mainResult, explanationResult, allReports, output_str, last;
      return _regenerator().w(function (_context) {
        while (1) switch (_context.n) {
          case 0:
            if (inputText.trim()) {
              _context.n = 1;
              break;
            }
            setQuizText("");
            setSummaryText("");
            setExplanationText("Please enter a passage and a request.");
            setFlashcardText("");
            return _context.a(2);
          case 1:
            setIsLoading(true);
            setQuizFeedback("");
            lowered = inputText.toLowerCase();
            _context.n = 2;
            return __jacSpawn("task_manager", "", {
              "utterance": inputText
            });
          case 2:
            mainResult = _context.v;
            console.log("Main result from task_manager:", mainResult);
            explanationResult = null;
            if (!(lowered.includes("explain") || lowered.includes("explanation"))) {
              _context.n = 4;
              break;
            }
            _context.n = 3;
            return __jacSpawn("explainationwalker", "", {
              "utterance": inputText
            });
          case 3:
            explanationResult = _context.v;
          case 4:
            allReports = [];
            if (mainResult.reports) {
              allReports = allReports.concat(mainResult.reports);
            }
            if (explanationResult && explanationResult.reports) {
              allReports = allReports.concat(explanationResult.reports);
            }
            console.log("Merged backend reports:", allReports);
            output_str = "";
            if (allReports.length > 0) {
              last = allReports[allReports.length - 1];
              if (typeof last === "string") {
                output_str = last;
              } else if (last.response) {
                output_str = last.response;
              } else if (last.output) {
                output_str = last.output;
              } else {
                output_str = JSON.stringify(last, null, 2);
              }
            } else {
              output_str = "No response from backend.";
            }
            console.log("Output str:", output_str);
            if (lowered.includes("quiz") || lowered.includes("mcq") || lowered.includes("multiple choice")) {
              setQuizText(output_str);
              setSummaryText("");
              setExplanationText("");
              setFlashcardText("");
            } else if (lowered.includes("summarize") || lowered.includes("summary")) {
              setQuizText("");
              setSummaryText(output_str);
              setExplanationText("");
              setFlashcardText("");
            } else if (lowered.includes("flashcard") || lowered.includes("flash card")) {
              setQuizText("");
              setSummaryText("");
              setExplanationText("");
              setFlashcardText(output_str);
            } else if (lowered.includes("explain") || lowered.includes("explanation")) {
              setQuizText("");
              setSummaryText("");
              setExplanationText(output_str);
              setFlashcardText("");
            } else {
              setQuizText("");
              setSummaryText("");
              setExplanationText(output_str);
              setFlashcardText("");
            }
            setIsLoading(false);
          case 5:
            return _context.a(2);
        }
      }, _callee);
    }));
    return _handleProcess.apply(this, arguments);
  }
  return __jacJsx("div", {
    "style": {
      "minHeight": "100vh",
      "padding": "32px 16px",
      "background": "radial-gradient(circle at top,#e0f2fe 0,#dbeafe 35%,#e5e7eb 100%)",
      "color": "#0f172a",
      "fontFamily": "system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif",
      "display": "flex",
      "justifyContent": "center"
    }
  }, [__jacJsx("div", {
    "style": {
      "width": "100%",
      "maxWidth": "1400px",
      "background": "rgba(255,255,255,0.9)",
      "backdropFilter": "blur(12px)",
      "borderRadius": "28px",
      "border": "1px solid rgba(191,219,254,0.9)",
      "padding": "26px 30px 28px 30px",
      "boxShadow": "0 22px 60px rgba(15,23,42,0.25)"
    }
  }, [__jacJsx("h1", {
    "style": {
      "margin": "0 0 6px 0",
      "fontSize": "30px",
      "fontWeight": "750",
      "textAlign": "center",
      "color": "#1d4ed8",
      "letterSpacing": "0.03em"
    }
  }, ["AI Study Helper"]), __jacJsx("div", {
    "style": {
      "marginBottom": "20px",
      "fontSize": "13px",
      "color": "#4b5563",
      "textAlign": "center"
    }
  }, ["Type a passage and include a keyword: quiz, summarize, explain, or flashcards."]), __jacJsx("textarea", {
    "value": inputText,
    "onChange": function onChange(e) {
      setInputText(e.target.value);
    },
    "placeholder": "Paste your passage here and say what you want (for example: 'Summarize this...', 'Create a quiz...', 'Explain like I am 10...', 'Make flashcards...').",
    "style": {
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
    }
  }, []), __jacJsx("div", {
    "style": {
      "textAlign": "center",
      "marginBottom": "24px"
    }
  }, [__jacJsx("button", {
    "onClick": function onClick(e) {
      handleProcess();
    },
    "style": {
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
    }
  }, [isLoading ? "Working..." : "Click me"])]), __jacJsx("div", {
    "style": {
      "display": "grid",
      "gridTemplateColumns": "repeat(auto-fit, minmax(320px, 1fr))",
      "gap": "22px"
    }
  }, [__jacJsx(RenderQuizCard, {
    "quizText": quizText,
    "quizFeedback": quizFeedback,
    "quizAnswer": quizAnswer,
    "setQuizAnswer": setQuizAnswer,
    "setQuizFeedback": setQuizFeedback
  }, []), __jacJsx(Block, {
    "title": "Summarize",
    "subtitle": "Concise summary of key ideas.",
    "content": summaryText,
    "dotColor": "#22c55e"
  }, []), __jacJsx(Block, {
    "title": "Explain",
    "subtitle": "Step-by-step or simple explanation.",
    "content": explanationText,
    "dotColor": "#f97316"
  }, []), __jacJsx(Block, {
    "title": "Flashcards",
    "subtitle": "Q&A style cards for studying.",
    "content": flashcardText,
    "dotColor": "#ec4899"
  }, [])])])]);
}
export { Block, RenderQuizCard, app };