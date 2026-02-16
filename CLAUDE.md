# Trading Analysis Workspace

## Stock Analysis Framework

*Last updated: 2026-02-15 | Version 3.0*

---

## When to Use This Framework

- **Full analysis** — Run all sections when the user asks for "analysis," "research," "deep dive," "report," or similar. This is the default for any open-ended request like "look into $SYM for me."
- **Quick take** — If the user asks for a "quick take," "summary," or "what's happening with $SYM," provide only Sections 1, 2, 3, and 14 (Executive Summary, Price Action, Technical Snapshot, Near-Term Outlook). Skip the Typst report unless explicitly requested.
- **Simple price check** — If the user asks "what's $SYM at?" or "price of $SYM," just look up and report the current price. Do not run the framework.

## Analysis Depth

- **Default depth:** ~2,000-3,000 words in chat output. Cover every section with enough detail to be actionable.
- **Deep dive:** If the user requests extra depth, expand to ~4,000-5,000 words, adding more granular data and longer commentary per section.
- **Quick take:** ~500-800 words covering only the abbreviated section set above.

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

---

## Part A: Analysis Methodology

### 1. Executive Summary

Open with a 2-3 sentence **TL;DR** capturing:
- Current price direction and momentum
- The single most important thing an investor should know right now
- Overall sentiment (bullish / bearish / neutral)

> **Ordering note:** Populate this section only after completing Sections 2-14. It appears first in the output but is written last. Section 15 (Data Quality) is independent and can be written separately.

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

#### Balance Sheet & Debt Profile
- Debt-to-equity ratio, net debt position
- Interest coverage ratio
- Upcoming debt maturities or refinancing needs
- Credit rating (if rated)

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

---

## Part B: Quality Standards

### 15. Data Quality & Confidence

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
- Use `figure()` with captions for all tables
- Maintain `heading(numbering: "1.1")` so sub-sections render as 5.1, 5.2, etc.
- Keep body text at 10pt; use 8pt for disclaimers and headers
- Set `{Report Type}` in the header and title to match the asset class: "Equity Research" for stocks, "ETF Research" for ETFs, "Crypto Research" or "Commodity Research" as appropriate
- Escape `<` as `\<` in body text — bare `<` is label syntax in Typst and will cause compilation errors (e.g., write `\<1%`, `\<0.5x`)
- Escape `$` as `\$` in body text — bare `$` opens math mode in Typst and will cause "unclosed delimiter" compilation errors. This applies everywhere, including inside `block()` and `grid()` content (e.g., write `\$2.3B`, `\>\$10`)
- After writing the file, inform the user of the file path

---

## Search Queries

For any symbol `$SYM`, run these queries in parallel. Queries are grouped by theme — if a group's first query returns comprehensive results, the second query can be skipped.

**Fallback when queries return poor results:** If a query returns no useful data (common for small-caps, recent IPOs, or foreign-listed stocks), try one reformulated query using the company name instead of the ticker, or a broader industry term. If that also fails, note the gap in Section 15 (Data Quality) and move on — do not repeatedly retry the same query.

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
