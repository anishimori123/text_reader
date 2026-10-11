# 🎙 Text Reader — Radio v8.1.6

> Japanese TTS Radio with browser voices + Azure HD, voice switch while playing, skip logic, stable timer.

**Live Demo:** After you enable GitHub Pages, it will be at `https://anishimori123.github.io/text_reader/`

**Current Version:** `v8.1.6-fixed` (2026-10-11)
**Previous Version:** `v8.1.5` (buggy)

## 📦 What's Inside
- `index.html` — Main app (single file, works offline except Azure)
- `CHANGELOG.md` — Every version + bug fixed audit
- `VERSION` — Current version number
- `memory/` — Daily learning notes for ML

## 🚀 How to Run (Kid Version)
1. Download `index.html`
2. Double-click it — it opens in Chrome/Edge
3. Paste Japanese text and press PLAY

## 🔧 Bug Fix Audit
See `CHANGELOG.md` for full audit. Summary:
- v8.1.5 had 7 bugs (SSML escape, timer pause, Azure persist, rate format, memory leak, splitter, SDK check)
- v8.1.6 fixed all 7

## 🧠 How This Repo Connects to My-Agent Brain
This repo is your **product**. Your private repo `my-agent` is your **brain**.
- `my-agent/memory/` stores what you learned building this
- `text_reader/memory/` stores release notes

Daily loop:
1. Morning: Upload `my-agent/memory/YYYY-MM-DD.md` to meta.ai
2. Say: "Load brain, let's work on text_reader v8.2"
3. Evening: Export memory and push to BOTH repos

## 📋 Roadmap
- [x] v8.1.6 — Fix 7 critical bugs
- [ ] v8.2.0 — Save progress to localStorage + GitHub sync
- [ ] v8.3.0 — Upload .txt / .pdf auto-split
- [ ] v8.4.0 — Daily streak + voice preference ML

## 📝 License
MIT — You own it.
