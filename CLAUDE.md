# CLAUDE.md — Rexo Investor Dashboard

Project memory for Claude Code. Loaded automatically each session.

## What this is
A **single self-contained HTML file** (`index.html`) — a live, rule-based investor
decision model for the Rexo software portfolio. No build step, no server, no
dependencies, no internet required. Open `index.html` in a browser and present.

Every figure is a **transparent, deterministic calculation** from editable inputs —
no AI estimation — so it is fully auditable in investor meetings.

Stage (as of June 2026): **pre-revenue**. 4 products in paid beta (5 pilot
companies), 2 in development. Paid sales start Dec 2026 / Jun 2027. The model is a
planning + investor pitch tool, not a revenue tracker.

## Products modelled (6)
RexoBooks · RexoPayroll · RexoCompliance OS · PracticeDesk · RexoGST · Siteledge

## Repo layout
- `index.html` — the entire app (inline `<style>` + `<script>`, vanilla JS, hand-rolled
  `<canvas>` charts, **zero external libraries**).
- `legacy/` — original v1 dashboard, kept for reference only.
- `README.md` / `CHANGELOG.md` — product docs and version history (currently v3.0).

## Where the data lives (most edits happen here)
- **`sampleProducts` array** in `index.html` (~line 551) — the default model every
  fresh visitor sees. Each product object has:
  `fee, subs, recurring, dev, mkt, fixed, churn, cac, status, betaCompanies, pilotFee, launchMonth`.
  - `subs` = TARGET paying subscribers at launch + 12 months.
  - `betaCompanies` / `pilotFee` = today's paid-pilot reality (Current view).
  - `launchMonth` = months from now (Jun 2026).
- `NUMERIC_KEYS` (~line 560) lists the editable numeric fields.
- Core math: `computeProduct()` (~line 620) and the portfolio totals reducer (~line 663);
  projection logic in `computeProjection()` (~line 940).

## Key behaviour to remember
- **Everything is derived.** Changing a product's inputs (e.g. `subs`) auto-recomputes
  revenue, profit, ARR, margin, LTV/CAC, valuation, 36-month projection, break-even,
  peak funding need, and investor returns. Usually you only edit `sampleProducts`.
- **"Target Subscribers" KPI = sum of all products' `subs`.** (Currently 1000.)
- **Current ⇄ Target toggle** flips KPIs/charts/tables between today's paid-pilot
  reality and the target plan.
- **localStorage caching:** the app persists edits to `localStorage`
  (`rexoInvestorProducts`, `rexoScenarios`). A returning browser sees its cached copy,
  NOT the new defaults — use the in-app **Reset model** button or incognito to see
  fresh `sampleProducts` after a code change.
- Currency is INR (`en-IN`, ₹ / Lakh / Crore).
- Shipped numbers are **sample assumptions** — replace with validated actuals before
  formal circulation.

## Deployment workflow (IMPORTANT)
The live site is hosted on **GitHub Pages** from the `main` branch, root folder:

  **https://dprasadsaladi-dot.github.io/rexo-investor-dashboard/**

Remote: `https://github.com/dprasadsaladi-dot/rexo-investor-dashboard.git` (public).

To publish any change:
1. Edit `index.html`.
2. `git add index.html && git commit -m "..." && git push origin main`
3. GitHub Pages rebuilds in ~1–2 minutes; verify the live URL serves the new value.

Note: the repo is **public** — source and figures are visible to anyone with the link.

## Helper scripts (Windows, double-click)
- `open-dashboard.cmd` — open the local `index.html` in the default browser.
- `open-live.cmd` — open the live GitHub Pages site.
- `publish.cmd` — commit + push (prompts for a change description); live in ~1-2 min.

## Resuming a session later
Sessions are saved automatically. To continue a previous conversation:
1. Open a terminal and `cd C:\Regent-Tech-Repository\Invest` (must be this folder).
2. Run `claude --continue` (or `claude -c`) for the most recent session, or
   `claude --resume` (`claude -r`) to pick from a list. Inside a session, `/resume` also works.
All work is committed to git regardless, and this CLAUDE.md brings a fresh session up to speed.

## Conventions
- Keep it a single file with no external dependencies (offline-first is a core feature).
- Match the surrounding code style; charts are custom canvas code — reuse existing helpers.
- When changing subscriber/price/cost figures, keep the model **internally logical**
  (sensible per-product distribution, no products left with broken/negative economics
  unless intended) and verify totals.
