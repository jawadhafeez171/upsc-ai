---
target: src/app/page.tsx
total_score: 34
max_score: 40
na_heuristics: 
p0_count: 0
p1_count: 1
target_identity: "file:C:\\Users\\build\\Desktop\\webapps\\upsc ai\\upsc-ai\\src\\app\\page.tsx"
target_fingerprint: "sha256:4f378a43ce5ce24232b434f9b4349152eb2f9dc939e99b24a9d633d7f6146046"
target_path: "C:\\Users\\build\\Desktop\\webapps\\upsc ai\\upsc-ai\\src\\app\\page.tsx"
timestamp: 2026-11-02T10-49-01Z
slug: src-app-page-tsx
---
# Critique: UPSC AI Homepage & Landing Surface (`src/app/page.tsx`)

Method: dual-agent (A: 50485c66-ef07-4ace-a797-f00265e9f9cd · B: fe65f1ca-59b4-4507-83a3-465246aebfed)

#### Design Health Score

| # | Heuristic | Score | Key Finding & Evidence |
|---|-----------|:-----:|------------------------|
| 1 | **Visibility of System Status** | **4/4** | Outstanding real-time interactive preview. Option selection, language toggle feedback, and instant explanation reveal operate live on the page. |
| 2 | **Match Between System & Real World** | **4/4** | Speaks authentic civil services language: "CSAT Paper II", "Prelims Cutoff", "GS Paper 1", "Negative Marking (-0.66)", and "PYQ Archive (1995–2024)". |
| 3 | **User Control & Freedom** | **3/4** | Direct access to tests and archive without forced registration paywalls. Minor gap: interactive hero preview cannot be reset once answered without page reload. |
| 4 | **Consistency & Standards** | **3/4** | High-converting landing architecture. Flaws: Brand identity split between "MockIQ" in the Navbar and "UPSC AI" in the hero; card radii drift (`14px`, `16px`) outside DESIGN.md (`12px`). |
| 5 | **Error Prevention** | **4/4** | Robust CTAs with explicit destination labels ("Launch Test Terminal", "View 2024 Prelims Paper"). No dead buttons or broken links. |
| 6 | **Recognition Rather Than Recall** | **4/4** | Syllabus taxonomy mapped into clear subject tiles (Polity & Governance, Modern History, Economy & Budget, Environment & Ecology, Science & Technology, CSAT). |
| 7 | **Flexibility & Efficiency of Use** | **3/4** | Direct one-click quick-start buttons for popular subjects allowing direct entry into targeted question practice. |
| 8 | **Aesthetic & Minimalist Design** | **3/4** | High-contrast `DM Sans` typography and warm paper canvas. Flaw: Diffuse radial gradient glow backgrounds (`hero-glow-1`, `hero-glow-2`) clash with the crisp Neo-Brutalist editorial aesthetic. |
| 9 | **Help Users Recognize, Diagnose, & Recover** | **3/4** | Clean fallback states for dynamic question fetching. |
| 10 | **Help & Documentation** | **3/4** | Transparent 3-step practice flow explanation (Select Subject -> CBT Simulation -> AI Diagnostic Breakdown). |
| **Total** | | **34/40** | **Strong / Production-Grade (Grade A- / 34/40)** |

#### Design Specificity Verdict

- **LLM Assessment**: High domain specificity. Avoids generic AI marketing boilerplate by providing immediate, verifiable proof: a functioning interactive UPSC Prelims question right in the hero, 30-year PYQ archive metrics, and syllabus breakdown. Residual issues: Brand name oscillation ("MockIQ" vs "UPSC AI"), minor card radius drift, and soft gradient glows that clash with the editorial paper aesthetic.
- **Deterministic Scan**: Assessment B confirmed **0 hard anti-patterns** across `src/app/page.tsx` (Exit Code 0). 45 advisory notices regarding fluid clamp endpoints and literal alpha tints.
- **Visual Overlays**: CLI deterministic AST/regex validation passed cleanly with 0 anti-patterns.

#### Overall Impression
A compelling, high-converting entrance page that establishes immediate academic credibility through live interactive proof. Primary opportunities: unify brand naming to "UPSC AI", align card corner radii to the `DESIGN.md` token scale (`12px`), and replace soft radial glows with crisp editorial boundaries.

#### What's Working
1. **Interactive In-Situ Question Demonstrator**: Live UPSC question in the hero dismantles candidate skepticism in 5 seconds without requiring sign-up.
2. **Rigorous Exam Taxonomy**: Granular breakdown into official UPSC GS and CSAT domains with authentic year spans (1995–2024).
3. **Bilingual Parity Upfront**: Instant English/Hindi toggle inside the hero demonstrator shows bilingual capability before test launch.

#### Priority Issues
- **[P1 - Brand Cohesion] Brand Dissonance**: Navbar displays "MockIQ", while the hero and test engine use "UPSC AI".
- **[P2 - Design System] Card Radius Drift**: Feature cards use `14px` and `16px` radii, drifting outside DESIGN.md scale (`12px` / `--radius-xl`).
- **[P2 - Visual Identity] Residual Radial Glows**: Soft diffuse pastel glows (`hero-glow-1`, `hero-glow-2`) clash with the crisp Neo-Brutalist editorial canvas.
