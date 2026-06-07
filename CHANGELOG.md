# Changelog

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
