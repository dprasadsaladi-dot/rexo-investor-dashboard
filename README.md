# Rexo Investor Dashboard

A live, **rule-based** investor decision model for the Rexo software portfolio — built as a single, self-contained HTML file. No build step, no server, no dependencies, no internet required. Double-click `index.html` and present.

Every number is a transparent, deterministic mathematical calculation from your inputs. **There is no AI estimation in the figures** — fully auditable for investor meetings.

## Products modelled

RexoBooks · RexoPayroll · RexoCompliance OS · PracticeDesk · RexoGST · Siteledge

## What it does

| Tab | Purpose |
|-----|---------|
| **Executive Dashboard** | Portfolio KPIs (revenue, profit, ARR, margin, blended LTV:CAC, valuation), revenue & profitability charts, and a full investor snapshot table per product. |
| **Product Model** | Editable assumptions per product — fee, subscriptions, recurring %, dev/infra %, marketing/support %, fixed cost, monthly churn, CAC. Plus a **Target Profit / Investment Recovery** calculator that solves for the required price and subscriber count. |
| **Unit Economics** | ARPU, gross margin, churn, customer lifetime, **LTV, CAC, payback period and LTV:CAC ratio** per product, with an LTV:CAC chart and a cohort retention curve. |
| **Scenario Lab** | Live sliders for price, subscriptions, dev cost, marketing cost, fixed cost and loss reserve. **Save named scenarios and compare them side-by-side** (Base vs Aggressive vs Conservative). |
| **36-Month Projection** | Growth, churn, annual price increase and cost inflation drive a month-by-month revenue/profit/cumulative-cash projection with a trend chart. |
| **Valuation** | Weighted ARR-multiple + profit-multiple valuation per product, with risk status. |
| **Investment & Returns** | Equity round math (implied pre/post-money, dilution, runway), projected investor **MOIC & IRR** at exit, a debt/**EMI** alternative, and a return-sensitivity table. |

## Key features

- **Drag-or-type** every assumption — instant recalculation everywhere.
- **Break-even calculator** per product and portfolio-wide (no-loss price / required subscribers).
- **No-loss logic** via an unexpected-loss-reserve control.
- **Save / load / compare** named scenarios (stored in the browser).
- **Export** product model to CSV; **download/import** the full model as JSON to move it between machines.
- **Print / Save as PDF** for a board pack (print-optimised layout).
- Works **offline** and on any modern browser.

## Formulas

```
Monthly Revenue          = Fee × Subscriptions
Variable Expense         = Revenue × (Dev&Infra% + Marketing&Support% + Loss Reserve%)
Profit                   = Revenue − Variable Expense − Fixed Monthly Cost
Contribution / Subscriber= Fee × (1 − Total Variable %)
Break-even Subscribers   = Fixed Cost ÷ Contribution per Subscriber
Customer Lifetime (mo)   = 1 ÷ Monthly Churn        (capped at 120 months)
LTV                      = Fee × Gross Margin × Lifetime
CAC Payback (mo)         = CAC ÷ (Fee × Gross Margin)
LTV:CAC                  = LTV ÷ CAC
Valuation                = (ARR × ARR Mult × ARR Wt) + (Annual Profit × Profit Mult × Profit Wt)
EMI                      = P·r·(1+r)ⁿ / ((1+r)ⁿ − 1)     reducing balance
MOIC                     = Investor stake value at exit ÷ Investment
IRR (p.a.)               = MOIC^(1/years) − 1
```

## Usage

Open `index.html` in any browser — that's it.

Your edits (product model + saved scenarios) persist automatically in the browser via `localStorage`. To carry the model to another machine, use **Download Model (JSON)** and **Import Model**.

## Notes

- Currency is INR (`en-IN` formatting, ₹ / Lakh / Crore).
- The shipped numbers are **sample assumptions** — replace them with validated actuals before formal circulation.
- `legacy/` holds the original first-version dashboard for reference.

---
Prepared as a presentation-ready investor model for Rexo Software Products.
