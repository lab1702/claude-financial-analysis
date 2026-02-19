# Trading Analysis Workspace

## Stock Analysis Framework

*Last updated: 2026-02-19 | Version 4.0*

---

## When to Use This Framework

- **Full analysis** — Run all sections when the user asks for "analysis," "research," "deep dive," "report," or similar. This is the default for any open-ended request like "look into $SYM for me."
- **Quick take** — If the user asks for a "quick take," "summary," or "what's happening with $SYM," provide only Sections 1, 2, 3, 14, and 15 (Executive Summary, Price Action, Technical Snapshot, Near-Term Outlook, Trade Setup). Skip the Typst report unless explicitly requested.
- **Simple price check** — If the user asks "what's $SYM at?" or "price of $SYM," just look up and report the current price. Do not run the framework.
- **Comparative analysis** — When the user asks to compare two or more symbols (e.g., "compare AAPL vs MSFT," "$SYM1 or $SYM2?"), run the comparative mode described in its own section below.
- **Follow-up analysis** — When a report already exists for the same symbol (any prior date), automatically engage the delta-analysis workflow described below.

## Analysis Depth

- **Default depth:** ~2,000-3,000 words in chat output. Cover every section with enough detail to be actionable.
- **Deep dive:** If the user requests extra depth, expand to ~4,000-5,000 words, adding more granular data and longer commentary per section.
- **Quick take:** ~500-800 words covering only the abbreviated section set above.
- **Comparative analysis:** ~3,000-4,000 words total (not per symbol). Focus on the unified comparison rather than repeating full standalone analyses.

## Asset-Class Adaptations

**Equities (default):** Follow all sections as written.

**ETFs:** Skip Sections 9 (Options — unless the ETF is heavily traded in options) and 10 (Insider Activity). Add holdings breakdown, expense ratio, AUM, and fund flows.

**Crypto / Commodities:** Skip equity-specific sections — 5 (Fundamentals), 6 (Valuation), 10 (Insider Activity), 11 (Analyst Consensus). Add on-chain metrics or supply dynamics, inventory data, and network/protocol-specific context as appropriate.

**International equities (modifier, applies on top of the equity framework):** Note the primary exchange and currency, whether an ADR exists, and any relevant jurisdictional or regulatory differences (e.g., reporting cadence, disclosure requirements, currency risk).

## Section Prioritization by Stock Type

Not every section carries equal weight for every stock. Adjust depth accordingly:
- **Pre-earnings plays:** Prioritize Sections 4 (Catalysts), 9 (Options), and the earnings-reaction subsection of Section 2 (Price Action)
- **Growth / momentum stocks:** Prioritize Sections 3 (Technical), 5 (Fundamentals), 6 (Valuation), and 12 (Sentiment)
- **Income / dividend stocks:** Prioritize Sections 5 (Fundamentals), 7 (Dividends), and 6 (Valuation)
- **Speculative / high-short-interest:** Prioritize Sections 8 (Short Interest), 9 (Options), and 12 (Sentiment)
- **Distressed / turnaround:** Prioritize Sections 5 (Fundamentals — especially debt profile), 10 (Insider Activity), and 13 (Macro/Sector)
- **Large-cap / blue-chip:** Prioritize Sections 6 (Valuation), 7 (Dividends), 13 (Macro/Sector), and 16 (Relative Strength)
- **Small-cap / low-coverage:** Prioritize Sections 5 (Fundamentals), 8 (Short Interest), 17 (Liquidity), and 18 (Data Quality — gaps are expected)

---

## Part A: Analysis Methodology

### 1. Executive Summary

Open with a 2-3 sentence **TL;DR** capturing:
- Current price direction and momentum
- The single most important thing an investor should know right now
- Overall sentiment (bullish / bearish / neutral)

Include a **Confidence** tag after the sentiment:
- **High:** 12+ of the analysis sections fully populated, key data <7 days old, sources broadly agree
- **Medium:** 9-11 sections populated, some data 7-30 days old, or minor source conflicts
- **Low:** <9 sections populated, significant data gaps, stale data, or major source conflicts

> **Ordering note:** Populate this section only after completing Sections 2-14. It appears first in the output but is written last. Section 18 (Data Quality) is independent and can be written separately.

### 2. Current Price & Recent Price Action

- Look up the current share price
- Identify significant moves in the last 1-2 weeks and what drove them (earnings, news, macro events)
- Note any notable intraday or multi-day trends

#### Earnings Reaction History
How the stock moved after each of the last 4 earnings reports (beat/miss and resulting % move), to contextualize any upcoming report.

### 3. Technical Snapshot

- Key moving averages (50-day, 200-day) and whether price is above or below them
- RSI (overbought/oversold)
- Notable support and resistance levels
- Recent volume trends relative to average

#### Relative Strength & Performance Context
- Performance vs. SPY and the most relevant sector ETF over 1-week, 1-month, 3-month, and YTD windows
- Is the stock leading or lagging its sector? Outperforming or underperforming the broad market?
- Note any notable divergences (e.g., stock falling while sector rallies, or vice versa)

#### Seasonality & Historical Patterns
- How the stock has typically performed in the current calendar month or quarter over the last 5 years (if a clear pattern exists)
- Pre- and post-earnings drift tendencies (does it tend to run up before earnings? sell the news?)
- Any known seasonal business drivers (e.g., retail in Q4, energy in winter heating season)

### 4. Upcoming Catalysts

- Earnings dates and any pre-announcements or guidance
- Product launches, regulatory decisions, contract awards
- Conferences, investor days, or management presentations

### 5. Fundamental Picture

#### Positives
- Revenue and earnings growth trends (recent quarters)
- Margin expansion, free cash flow strength, return on equity
- Industry/sector tailwinds
- Strategic initiatives (acquisitions, partnerships, new products)

#### Negatives
- Revenue or earnings declines
- Margin compression, cash burn
- Industry/sector headwinds
- Legal, regulatory, or competitive risks

#### Earnings Quality & Accounting Flags
- GAAP vs. adjusted EPS spread — note if the gap is widening over time (yellow flag)
- Cash flow from operations vs. net income — persistent divergence suggests accrual concerns
- Revenue recognition approach (especially for SaaS, long-cycle contracts, or percentage-of-completion methods)
- Any recent auditor changes, restatements, or SEC comment letters

#### Revenue Concentration & Supply Chain
- Top customer concentration (flag if any single customer is >15% of revenue)
- Geographic revenue breakdown (domestic vs. international split, exposure to specific regions)
- Key supplier or input dependencies (single-source components, commodity exposure)
- If data is unavailable (common for companies that don't disclose), note the gap and move on

#### Balance Sheet & Debt Profile
- Debt-to-equity ratio, net debt position
- Interest coverage ratio
- Upcoming debt maturities or refinancing needs
- Credit rating (if rated)

#### Management & Governance
- CEO tenure and notable track record
- Recent C-suite or board turnover (last 12 months)
- Executive compensation structure — is it aligned with shareholders? (stock-heavy vs. cash-heavy, performance-linked metrics)
- Governance red flags: dual-class share structures, poison pills, related-party transactions, classified boards
- If the company is founder-led, note this — it can be a positive (vision alignment) or negative (entrenchment)

### 6. Valuation & Peer Comparison

#### Valuation Multiples
- P/E (trailing & forward), P/S, EV/EBITDA, PEG ratio
- How these compare to the stock's own 5-year historical averages
- Note whether the stock appears cheap, fairly valued, or expensive on each metric

#### Peer Benchmarking (present as a table)
- Identify 2-3 closest public competitors
- Compare revenue growth rates, margins, and the valuation multiples above
- Note any market-share shifts or competitive dynamics

### 7. Dividends & Capital Returns

- Current dividend yield and payout ratio
- Dividend growth history (last 3-5 years)
- Share buyback programs (active? size? pace?)
- If the stock does not pay a dividend, state so briefly and move on

### 8. Short Interest & Float Dynamics

- Current short interest (shares short, % of float)
- Days to cover
- Note if short interest is elevated enough to create squeeze potential

### 9. Options Activity

- Put/call ratio and any notable skew
- Unusual options flow (large block trades, sweeps)
- Implied volatility vs. historical volatility, especially around upcoming events

### 10. Insider & Institutional Activity

- Recent insider buys or sells (last 90 days) and their size
- Notable institutional ownership changes (13F filings, major fund entries/exits)
- Any activist investor involvement

### 11. Analyst Consensus

- Number of analysts covering the stock
- Rating distribution (Buy/Hold/Sell)
- Price target range (low, median, high) and how current price compares

### 12. Online & Social Sentiment

- Reddit (WallStreetBets, stock-specific subs) — trending mentions, sentiment direction
- StockTwits, Twitter/X chatter
- News tone — is coverage predominantly bullish, bearish, or mixed?

### 13. Macro/Sector Context

- Relevant macro factors (interest rates, Fed policy, sector rotation)
- Industry-specific trends that directly impact the company
- Government policy or regulatory changes

### 14. Near-Term Outlook (1-3 month horizon)

Provide three scenarios with probability weightings that sum to 100%:
- **Bull case (assign %):** What goes right, key triggers that would confirm it, price target range
- **Bear case (assign %):** What goes wrong, key triggers that would confirm it, downside level
- **Most likely scenario (assign %):** Balanced assessment with expected trading range

Flag the single biggest risk and the single biggest catalyst.

### 15. Trade Setup

Translate the analysis into actionable parameters. This section bridges the gap between research and execution.

- **Directional bias:** Long / Short / Neutral (with conviction level: high / moderate / low)
- **Entry zone:** A price range for initiating a position, anchored to a technical level or catalyst (e.g., "on a pullback to $142-145 support" or "on a breakout above $160 resistance")
- **Stop-loss:** A specific level or percentage with rationale (technical support break, below key moving average, or max acceptable loss)
- **Price targets:** Primary target and stretch target, derived from the bull/base scenarios in Section 14
- **Risk/reward ratio:** Distance to primary target vs. distance to stop (express as X:1)
- **Position sizing guidance:**
  - *Full position* — High conviction, favorable risk/reward (>2:1), strong catalyst alignment
  - *Half position* — Moderate conviction, acceptable risk/reward, or elevated volatility
  - *Small / starter position* — Lower conviction, building a position into a catalyst, or wanting exposure while awaiting confirmation
- **Timeframe:** How long the thesis needs to play out (days, weeks, 1-3 months)

> **Disclaimer reminder:** Frame all trade setup language as informational analysis, not recommendations. The Typst report disclaimer already covers this, but avoid imperative language like "buy at $X" — prefer "the analysis suggests an entry zone near $X."

### 16. Relative Strength Dashboard

Present a compact table showing the stock's performance vs. benchmarks:

| Timeframe | $SYM | SPY | Sector ETF | $SYM vs. SPY |
|-----------|------|-----|------------|---------------|
| 1 Week    |      |     |            | +/- bps       |
| 1 Month   |      |     |            | +/- bps       |
| 3 Months  |      |     |            | +/- bps       |
| YTD       |      |     |            | +/- bps       |

- Note whether the stock is in a relative uptrend or downtrend vs. the market
- Identify any correlation shifts (e.g., "historically tracks oil prices, but has decoupled recently")

### 17. Liquidity & Tradability

- **Market cap tier:** Mega (>$200B) / Large ($10-200B) / Mid ($2-10B) / Small ($300M-2B) / Micro (<$300M)
- **Average daily volume:** 30-day average shares and dollar volume
- **Float:** Total shares outstanding, float, and float as a percentage of shares outstanding
- **Bid-ask spread:** Note if the stock is thinly traded or has wide spreads (common in small/micro-caps)
- **Options liquidity:** Whether options chains have tight spreads and sufficient open interest for practical trading (this directly affects the usefulness of Section 9)
- If the stock is a mega- or large-cap with deep liquidity, keep this section brief — it mainly matters for mid-caps and below

---

## Comparative Analysis Mode

When the user asks to compare two or more symbols, use this workflow instead of running separate full analyses.

### Research Phase
Run the standard search queries (see Search Queries section) for each symbol in parallel.

### Output Structure

1. **Overview Table** — Side-by-side snapshot of each symbol: price, market cap, sector, YTD performance, overall sentiment
2. **Price Action & Technical Comparison** — Who has stronger momentum, better relative strength, more favorable chart setup?
3. **Fundamental Comparison** — Unified table: revenue growth, EPS growth, margins, ROE, debt/equity for each symbol
4. **Valuation Comparison** — Unified table: P/E, P/S, EV/EBITDA, PEG for each symbol, highlighting who trades at a premium/discount and whether it's justified
5. **Catalysts & Risks** — Key upcoming catalyst and biggest risk for each symbol, side by side
6. **Positioning & Sentiment** — Short interest, options activity, analyst consensus, social sentiment for each
7. **Verdict** — Rank the symbols across five dimensions, then give an overall pick:
   - **Growth:** Which has the better growth trajectory?
   - **Value:** Which offers more attractive valuation?
   - **Momentum:** Which has stronger technical momentum?
   - **Risk:** Which has a more favorable risk profile?
   - **Overall:** Synthesize into a recommendation with rationale

### Typst Report for Comparisons
- File naming: `{SYM1}_vs_{SYM2}_{YYYY-MM-DD}.typ` (for 3+ symbols: `{SYM1}_vs_{SYM2}_vs_{SYM3}_{YYYY-MM-DD}.typ`)
- Use side-by-side `grid()` layouts where practical
- All comparison tables should use `table()` with one column per symbol

---

## Follow-Up / Delta Analysis

When generating a new report for a symbol that already has a prior report file in the working directory (any date):

1. **Read the prior report** before starting research
2. **Add a "What Changed" callout box** immediately after the Executive Summary in both chat output and Typst report:
   - Price change since the last report (absolute and %)
   - Key developments that occurred since the last report date
   - Which prior scenarios played out (or didn't)
   - Conviction change: **Higher** / **Lower** / **Unchanged**, with a one-sentence rationale
3. **Flag thesis-altering developments** — If something materially changed the investment thesis (earnings surprise, acquisition, regulatory action), call it out prominently
4. In Section 18 (Data Quality), note which sections had meaningful changes vs. the prior report and which remained largely the same

---

## Part B: Quality Standards

### 18. Data Quality & Confidence

- Flag any data points older than 30 days
- Note where sources conflict and which source is preferred
- Call out sections where data was unavailable or sparse

#### Source Tracking

As you research, record the URL and date for each key data point. Include a numbered source list at the end of both the chat output and the Typst report. Prioritize primary sources (SEC filings, exchange data, company IR pages) over aggregators when available.

---

## Part C: Output & Delivery

### Conversation Output

Present the full analysis in markdown in the chat as you research (so the user can follow along).

### Typst Report Delivery

After the analysis is complete, write a professionally formatted Typst file to disk using the template at `templates/report.typ` (relative to the project root — the directory containing this `CLAUDE.md` file).

**File naming:** `{SYMBOL}_{YYYY-MM-DD}.typ` (e.g., `AAPL_2026-02-15.typ`)

**Overwrite rule:** Before writing the file, check if a file with the same name already exists in the working directory. If it does, delete it and replace it with the new run. Each symbol+date combination should only ever have one report file — the most recent run.

**Typst formatting rules:**
- Use `table()` for all financial comparisons (valuation, peers, earnings history)
- Use `block()` with fill colors for callout boxes (executive summary, risk/catalyst, scenarios)
- Use `sentiment-badge()` on the cover for overall sentiment
- Use `sentiment-badge()` a second time on the cover for the confidence level: green for High, orange for Medium, red for Low (e.g., `#sentiment-badge("Confidence: High", green)`)
- Use `figure()` with captions for all tables
- Maintain `heading(numbering: "1.1")` so sub-sections render as 5.1, 5.2, etc.
- Keep body text at 10pt; use 8pt for disclaimers and headers
- Set `{Report Type}` in the header and title to match the asset class: "Equity Research" for stocks, "ETF Research" for ETFs, "Crypto Research" or "Commodity Research" as appropriate
- Escape `<` as `\<` in body text — bare `<` is label syntax in Typst and will cause compilation errors (e.g., write `\<1%`, `\<0.5x`)
- Escape `$` as `\$` in body text — bare `$` opens math mode in Typst and will cause "unclosed delimiter" compilation errors. This applies everywhere, including inside `table()` cells, `block()`, and `grid()` content (e.g., write `[\$2.3B]`, `[\$0.07]`). This is especially easy to miss for dollar-denominated EPS values in table rows.
- Do not use `_` for emphasis inside content brackets that are arguments to a function call (e.g., table cells). Use `#emph[...]` instead — bare `_` in that context causes "unexpected underscore" errors (e.g., write `[#emph[Pending]]` not `[_Pending_]`)
- After writing the file, inform the user of the file path

**Post-write compilation check:** After writing the `.typ` file, run `typst compile {file}.typ` to verify it compiles without errors. If compilation fails:
1. Read the error output to identify the failing line(s)
2. Fix the Typst syntax in the `.typ` file (most common issues: unescaped `$`, `<`, or `_`)
3. Re-compile and repeat until the build succeeds
4. Report both the `.typ` and `.pdf` file paths to the user

---

## Search Queries

For any symbol `$SYM`, run these queries in parallel. Queries are grouped by theme — if a group's first query returns comprehensive results, the second query can be skipped.

**Fallback when queries return poor results:** If a query returns no useful data (common for small-caps, recent IPOs, or foreign-listed stocks), try one reformulated query using the company name instead of the ticker, or a broader industry term. If that also fails, note the gap in Section 18 (Data Quality) and move on — do not repeatedly retry the same query.

**Price & news** *(feeds Sections 2, 4)*
1. `"$SYM stock price today [current month year]"`
2. `"$SYM [company name] news [current month year]"`

**Technical** *(feeds Section 3)*
3. `"$SYM technical analysis moving average support resistance [current month year]"`

**Earnings & fundamentals** *(feeds Sections 5, 6, 7)*
4. `"$SYM [company name] earnings results [year]"`
5. `"$SYM [company name] balance sheet debt dividend"`

**Sentiment & social** *(feeds Section 12)*
6. `"$SYM stock reddit wallstreetbets [year]"`
7. `"$SYM stocktwits twitter sentiment [year]"`

**Analyst & valuation** *(feeds Sections 6, 11)*
8. `"$SYM analyst price target rating [year]"`
9. `"$SYM valuation PE EV EBITDA vs peers"`

**Positioning & flow** *(feeds Sections 8, 9)*
10. `"$SYM short interest [current month year]"`
11. `"$SYM unusual options activity [current month year]"`

**Ownership & catalysts** *(feeds Sections 4, 10)*
12. `"$SYM insider buying institutional ownership [year]"`
13. `"$SYM upcoming catalysts product launch regulatory [year]"`

**Macro/sector** *(feeds Section 13)*
14. `"$SYM [sector] market outlook [year]"`

**Relative performance & liquidity** *(feeds Sections 16, 17)*
15. `"$SYM vs SPY vs [sector ETF] performance [current month year]"`
16. `"$SYM average volume market cap float shares outstanding"`

**Management & governance** *(feeds Section 5 — Management & Governance)*
17. `"$SYM CEO management executive changes [year]"`
18. `"$SYM [company name] corporate governance insider compensation"`

**Seasonality** *(feeds Section 3 — Seasonality & Historical Patterns)*
19. `"$SYM stock seasonality monthly performance historical pattern"`
