# Changelog

## v3.0 — Pre-revenue staging
Reworked the model for the real June-2026 situation: pre-revenue, 4 products in paid beta, 2 in development, paid sales starting in 6–12 months.

### Added
- **Per-product stage** (`status`: Beta / Development), **beta-pilot count**, **pilot fee**, and **launch month** fields in the Product Model.
- **Current ⇄ Target toggle** on the Executive Dashboard — flips KPIs, snapshot, cards and charts between today's paid-pilot reality (revenue + burn) and the target plan.
- **Launch-aware 36-month projection** — pre-launch shows pilot revenue with full fixed-cost burn; post-launch ramps subscribers linearly to target over 12 months, then grows. Realistic J-curve.
- **Funding & Break-even Summary** — paid launch window, monthly break-even month, **peak funding need** (max cumulative burn), and cash-flow-positive month.
- **Launch markers** on the projection chart; calendar month labels (e.g. M6 · Dec '26) throughout.
- Investment runway now based on today's real burn and the projected peak funding need; EMI affordability framed against the target run-rate (with a pre-revenue caution).
- Stage badges across the snapshot table and product cards.

### Fixed
- Negative bars in bar charts were drawn upward; they now drop below zero with correct value labels.
- Clipped x-axis labels on charts (wrapped horizontal labels instead of rotated/cut text).

## v2.0 — Investor upgrade
Major upgrade of the original revenue dashboard into a full investor-meeting tool.

### Added
- **Unit Economics tab** — ARPU, gross margin, monthly churn, customer lifetime, LTV, CAC, CAC payback period and LTV:CAC ratio per product, with an LTV:CAC bar chart and a cohort retention curve.
- **Per-product `churn` and `cac`** inputs in the Product Model.
- **Blended LTV:CAC** KPI on the Executive Dashboard and an LTV:CAC column in the snapshot table.
- **Saved scenarios & comparison** — name, save, load, delete and compare scenarios side-by-side (Base / Aggressive / Conservative).
- **Investment & Returns tab** — equity round math (implied pre/post-money, dilution, runway), projected MOIC & IRR at exit, a return-sensitivity table, and a debt/EMI alternative calculator.
- **Download Model (JSON)** and **Import Model** to move the full model between machines.
- CSV export expanded with churn, CAC, LTV, payback and LTV:CAC columns.

### Changed
- Refactored projection logic into a reusable `computeProjection()` used by the projection tab and the investment exit calculation.
- Charts hardened (`setTransform` reset, ratio scale, divide-by-zero guards) and a print-optimised layout.
- Backward-compatible model loading — older saved models are auto-backfilled with the new fields.

## v1.0 — Original
Initial revenue, profitability, break-even, scenario, 36-month projection and valuation dashboard.
