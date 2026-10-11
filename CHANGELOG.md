# Changelog — Text Reader Audit Trail

All notable changes and bug fixes are documented here. This is your version control audit.

## [v8.1.6] - 2026-10-11 - Fixed Release
**Status:** ✅ Stable, Ready for GitHub Pages
**Files:** `index.html` (17,562 bytes)

### Bugs Fixed (7 total)
| # | Bug ID | Severity | File / Function | Before | After | Test |
|---|--------|----------|-----------------|--------|-------|------|
| 1 | SSML-001 | CRITICAL | `speakAt()` / `escapeXml()` | Only escaped `&` → `<script>` or `5 < 10` crashes Azure SSML | New `escapeXml()` escapes `& < > " '` all 5 | Paste `5 < 10 & 20 > 3` → should speak, not crash |
| 2 | TIMER-002 | HIGH | `pauseBtn.onclick` / `startTime` | `startTime` never adjusted on pause → remainTime negative after resume | Added `pausedElapsed` + `pauseStart` to track pause duration | Play 30s, pause 10s, resume → remainTime correct |
| 3 | PERSIST-003 | HIGH | `azureKeyEl` | Key in `type="text"` visible + lost on refresh | `type="password"` + `localStorage.radio_azureKey` + Clear button | Refresh page → key still there |
| 4 | RATE-004 | HIGH | SSML `prosody rate` | `(rate*100-100)+'%'` → 2x = `100%` (Azure thinks 100% = 1x) | `rate = (currentRate-1)*100` → `+100%` for 2x, `-50%` for 0.5x | Test 0.5x, 2x, 3x in Azure → speed matches browser |
| 5 | LEAK-005 | MEDIUM | `azureSynthesizer` | New synth each sentence, `close()` not always called → audio stops after ~50 sentences | New `closeAzure()` helper called before every `createAzureSynth()` | Play 100+ sentences long text → no stop |
| 6 | SPLIT-006 | MEDIUM | `splitRadioSegments()` | `x.length>=2 && !/[ぁ...]/` drops valid `！！` | Simplified: `length<2` early return, cleaner regex | Input `！！！！` → skipped correctly, `こんにちは！！` kept |
| 7 | SDK-007 | MEDIUM | `azureTest.onclick` | No check if SDK loaded → `SpeechSDK is not defined` error | Added `typeof SpeechSDK==='undefined'` guard | Disconnect internet, click Test → friendly alert |

### Added
- `localStorage` for rate, voice, azure voice, system voice, azure key, region, mode
- Keyboard accessibility: `tabIndex` + Enter to jump
- `beforeunload` cleanup: close Azure + cancel speech
- Audit files: `CHANGELOG.md`, `VERSION`, `memory/`

### Changed
- `totalSec` calculation: `/6.5` → `/4.5` (more accurate for Japanese)
- Progress bar: `transition:width .2s` smoother

---

## [v8.1.5] - 2026-10-10 - Latest Skip Special + Voice Switch Fixed + Stable (Original)
**Status:** ⚠️ Buggy — Has 7 bugs listed above
**Files:** Single HTML file pasted in chat

### Features Added in v8.1.5
- Latest splitter: skip `::::::::` and `…………` patterns
- Voice switch while playing works across browser + Azure
- Live board sticky UI
- Pitch lock per voice (Keita 1.0 ... Haru 0.88)

### Known Issues (Fixed in v8.1.6)
- See bugs 1-7 above

---

## [v8.1.4] and earlier — Not tracked
If you have older versions, add them here retroactively.

---

## Versioning Rules (For Future)
- `v8.1.x` = bug fix only
- `v8.2.0` = new feature (e.g., save progress)
- `v9.0.0` = breaking change (e.g., rewrite as React app)
- Every push must update `VERSION` and `CHANGELOG.md`
