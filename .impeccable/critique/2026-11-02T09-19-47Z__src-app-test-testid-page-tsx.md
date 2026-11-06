---
target: src/app/test/[testId]/page.tsx
total_score: 31
max_score: 40
na_heuristics: 
p0_count: 1
p1_count: 2
target_identity: "file:C:\\Users\\build\\Desktop\\webapps\\upsc ai\\upsc-ai\\src\\app\\test\\[testId]\\page.tsx"
target_fingerprint: "sha256:a25e8418743909611f27ee27e8a663125eef35e6ab5ded9a08d422003a63c6ed"
target_path: "C:\\Users\\build\\Desktop\\webapps\\upsc ai\\upsc-ai\\src\\app\\test\\[testId]\\page.tsx"
timestamp: 2026-11-02T09-19-47Z
slug: src-app-test-testid-page-tsx
---
# Critique: UPSC AI CBT Exam Simulation Interface (`src/app/test/[testId]/page.tsx`)

Method: dual-agent (A: 142af191-40b2-437d-baf7-86776b68616e · B: 3a9c7fc2-d4c5-4cf4-a09b-1c61c40234c4)

#### Design Health Score

| # | Heuristic | Score | Key Finding & Evidence |
|---|-----------|:-----:|------------------------|
| 1 | **Visibility of System Status** | **3/4** | Real-time countdown timer and 10-column question palette. Flaw: Timer displays in alarm red (`#DC2626`) continuously from minute 120, desensitizing candidates instead of escalating urgency at <15m and <5m. |
| 2 | **Match Between System & Real World** | **3/4** | Official TCS-iON/NTA layout and exact statutory terminology ("Mark for Review & Next", "Save & Next"). Tactile option elimination replicates pencil scratch work. Flaw: An "EXAM TIP" box containing answer clues during active exams breaks real-world testing fidelity. |
| 3 | **User Control & Freedom** | **3/4** | Full directional flexibility, font zoom adjuster (`A-`, `100%`, `A+`), and Full Paper modal. Flaw: On mobile, `SUBMIT` is dangerously adjacent to `SAVE & NEXT` in a cramped 4-column bottom bar. |
| 4 | **Consistency & Standards** | **2/4** | Status colors comply with DESIGN.md. Flaws: Legacy branding ("MockIQ" / "MockIQ LIVE") remains in the header; selected options in `cbt-terminal.css` use pale yellow `#FEFCE8` instead of DESIGN.md Royal Blue (`#2563EB`) and `#EFF6FF`. |
| 5 | **Error Prevention** | **3/4** | Robust multi-step submission dialog summarizing answered vs marked vs unattempted questions. Flaw: Hard timeout submission at `t <= 1` without pre-timeout audio or modal warning. |
| 6 | **Recognition Rather Than Recall** | **4/4** | Outstanding. Negative keywords ("NOT correct", "incorrect", "सही नहीं") auto-wrap in rose warning badges. Question palette summary defines all 5 states with live counters. |
| 7 | **Flexibility & Efficiency of Use** | **4/4** | Keyboard control suite (`1-4`, `A-D`, `Enter`, `N`, `P`, `M`), question scrubber, instant client-side Hindi/English toggle, and full paper view modal. |
| 8 | **Aesthetic & Minimalist Design** | **3/4** | Warm paper canvas (`#F4F1EA`) with deep slate typography (`#111827`) prevents eye fatigue. Flaw: Top chrome redundancy on desktop stacks the QuickNavigator on top of the Question Card while the right sidebar already provides the full palette. |
| 9 | **Help Users Recognize, Diagnose, & Recover** | **3/4** | Instant "Clear Response", post-test negative marking analytics (-0.66), and discrepancy reporting modal. |
| 10 | **Help & Documentation** | **3/4** | Accessible InstructionsModal detailing marking rules (+2.00 / -0.66) and color status legend. |
| **Total** | | **31/40** | **Strong / Competent (Grade B+ / 31/40)** |

#### Design Specificity Verdict

- **LLM Assessment**: Deeply grounded in official civil services testing architecture. Handles multi-statement assertions, List I vs List II pair matching, and bilingual Devanagari/Kannada script scaling (`106%`). However, practice-mode feature creep leaks question explanations via the `💡 EXAM TIP` box during active timed tests, and legacy "MockIQ" branding remains in the header.
- **Deterministic Scan**: Assessment B confirmed **0 hard anti-patterns** across `src/app/test` and UI question components (all 11 legacy AI tells resolved). 11 advisory notes flagged micro-typography sizes (`11px`, `13px`) and domain status color literals.
- **Visual Overlays**: CLI deterministic AST/regex validation clean.

#### Overall Impression
An authentic, high-utility exam simulation with industry-leading editorial question formatting. The primary opportunities are eliminating the practice-mode explanation leak during active tests, harmonizing legacy branding to "UPSC AI", reducing redundant top chrome on desktop, and calibrating the timer's visual urgency.

#### What's Working
1. **Algorithmic Negative Keyword Detection**: Automatic rose pill highlighting for trap phrases (`NOT correct`, `incorrectly matched`, `except`, `सही नहीं`, `ಸರಿಯಲ್ಲ`).
2. **Tactile Strikethrough Elimination**: Aspirants can cross out options (`∓`), perfectly replicating pencil elimination on physical Prelims question booklets.
3. **Bilingual Parity with Script Scaling**: Hot-toggling between English and vernacular scripts with proper 106% Devanagari font scaling and generous line heights.

#### Priority Issues
- **[P0 - Exam Integrity] Explanation Leak via Exam Tip Box**: `CbtQuestionCard.tsx` (lines 82–85, 362–393) displays an `💡 EXAM TIP` box with the first 140 chars of the explanation during active mock exams.
- **[P1 - Branding & Design System] Legacy Brand & Option Token Divergence**: Header and candidate card display "MockIQ" and "IQ" instead of "UPSC AI". Selected options in `cbt-terminal.css` use yellow `#FEFCE8` instead of Royal Blue `#2563EB` / `#EFF6FF`.
- **[P1 - Screen Economy] Desktop Chrome Redundancy**: Top QuickNavigator + adjacent buttons duplicate the right sidebar's 10-column palette and consume ~140px of vertical space.
- **[P2 - Mobile Ergonomics] Dangerous Submit Button Placement**: Mobile bottom bar places `SUBMIT` immediately adjacent to `SAVE & NEXT`.
- **[P2 - Visual Urgency] Perpetual Red Timer**: Timer is rendered in alarming red (`#DC2626`) continuously for 120 minutes instead of starting in calm slate and escalating at <15m and <5m.
