# Trading Analysis Workspace

A structured stock analysis framework for Claude Code. Ask for analysis on any ticker and get a standardized, multi-section research report delivered in chat and as a `.typ` file you can compile into a PDF.

## Prerequisites

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) CLI installed and configured
- **Web search enabled** in Claude Code — the framework relies on live web searches for all data. Web search is currently available to US-based users.
- [Typst](https://typst.app/) installed locally to compile `.typ` reports into PDFs (`typst compile AAPL_2026-02-15.typ`).

## Quick Start

Open this directory in Claude Code, then ask for analysis:

```
analyze AAPL
```

Claude will research the stock across multiple parallel web searches, present findings section-by-section in chat as markdown, and write a formatted `.typ` report to the working directory.

## How It Works

The `CLAUDE.md` file contains the full framework instructions. Claude Code reads it automatically when working in this directory. No setup beyond the prerequisites is needed.

### Trigger Phrases

| What you say | What happens |
|---|---|
| "analyze TSLA", "deep dive on MSFT", "research NVDA" | Full 18-section analysis + Typst report |
| "quick take on AMZN", "what's happening with META" | Abbreviated 6-section summary (no report unless requested) |
| "compare AAPL vs MSFT", "NVDA or AMD?" | Side-by-side comparative analysis + Typst report |
| "what's GOOG at?" | Price lookup only |

### Analysis Sections

The full analysis covers:

1. **Executive Summary** — TL;DR with sentiment (written last, appears first)
2. **Current Price & Recent Price Action** — Current price, recent moves, earnings reaction history
3. **Technical Snapshot** — Moving averages, RSI, support/resistance, volume, relative strength, seasonality
4. **Upcoming Catalysts** — Earnings dates, product launches, regulatory events
5. **Fundamental Picture** — Positives, negatives, earnings quality, revenue concentration, balance sheet, management & governance
6. **Valuation & Peer Comparison** — Multiples vs. history and competitors (table)
7. **Dividends & Capital Returns** — Yield, payout ratio, buybacks
8. **Short Interest & Float Dynamics** — Short %, days to cover, squeeze potential
9. **Options Activity** — Put/call ratio, unusual flow, IV vs. HV, max pain, GEX
10. **Insider & Institutional Activity** — Recent buys/sells, 13F changes
11. **Analyst Consensus** — Ratings distribution, price target range
12. **Online & Social Sentiment** — Reddit, StockTwits, X, news tone
13. **Macro/Sector Context** — Rates, Fed policy, sector trends
14. **Near-Term Outlook** — Bull/bear/base scenarios with probabilities
15. **Trade Setup** — Entry zone, stop-loss, targets, risk/reward, position sizing
16. **Relative Strength Dashboard** — Performance vs. SPY and sector ETF across timeframes
17. **Liquidity & Tradability** — Market cap tier, volume, float, bid-ask spread
18. **Data Quality & Confidence** — Flags stale data, source conflicts, gaps

### Supported Asset Classes

- **Stocks** (US and international) — full framework
- **ETFs** — adapted (skips insider activity, adds holdings/AUM/flows)
- **Crypto / Commodities** — adapted (skips equity-specific sections, adds on-chain or supply data)

## File Structure

```
.
├── .gitignore               # Excludes generated .typ and .pdf files
├── CLAUDE.md                # Framework instructions (read automatically by Claude Code)
├── LICENSE
├── README.md                # This file
└── templates/
    └── report.typ           # Typst report template
```

Generated reports (e.g., `AAPL_2026-02-15.typ` and compiled PDFs) are written to the top-level directory but gitignored.

## Output

### Chat

The analysis is streamed in the conversation as markdown, section by section, as research progresses. This lets you follow along and ask follow-up questions before the report is finalized. Default depth is ~2,000-3,000 words (configurable in `CLAUDE.md`).

### Typst Report

Each analysis generates a Typst file named `{SYMBOL}_{YYYY-MM-DD}.typ` in the working directory. To compile it into a PDF:

```bash
typst compile AAPL_2026-02-15.typ
```

Reports include:
- Colored sentiment badge (bullish/bearish/neutral) and confidence badge (high/medium/low)
- Executive summary callout box
- Numbered sections matching the chat analysis
- Tables for earnings history, peer comparison, valuation, and relative strength
- Bull/bear/base scenario grid with color coding
- Risk/catalyst callout box
- Trade setup box with entry, stop, targets, and position sizing
- Disclaimer and numbered source list

Re-running analysis for the same symbol on the same date overwrites the previous report.

## Customization

All framework behavior is controlled by `CLAUDE.md`. Common modifications:

- **Add/remove sections** — Edit Part A in `CLAUDE.md` and add/remove the corresponding heading in `templates/report.typ`. Note: the template uses `#counter(heading).update(1)` so that section numbering starts at 2 (since the Executive Summary is Section 1 but rendered as an unnumbered block). If you add or remove sections before the existing ones, verify the counter still produces correct numbers.
- **Change search queries** — Edit the Search Queries section at the bottom of `CLAUDE.md`
- **Adjust depth defaults** — Edit the Analysis Depth section in `CLAUDE.md`
- **Modify report styling** — Edit `templates/report.typ` (fonts, colors, margins, layout)
- **Change section prioritization** — Edit the Section Prioritization table in `CLAUDE.md` to re-weight sections for different stock types

## Limitations

- Data is sourced from web searches at the time of analysis and may be delayed or incomplete
- Technical indicators (RSI, moving averages) depend on what search results surface — not computed from raw price data
- Social sentiment is directional, not quantitative
- Reports are informational only, not financial advice
