// ============================================================
// Trading Analysis — Typst Report Template
// ============================================================
// Usage: Copy this template when generating a report for a
// symbol. Replace all {PLACEHOLDER} tokens with actual data.
// {Report Type}: "Equity Research" for stocks, "ETF Research"
//   for ETFs, "Crypto Research" / "Commodity Research" etc.
// File naming: {SYMBOL}_{YYYY-MM-DD}.typ
// ============================================================

// — Page, font & heading setup —
#set page(
  paper: "us-letter",
  margin: (x: 1in, y: 1in),
  header: context {
    if counter(page).get().first() > 1 [
      #text(size: 8pt, fill: luma(120))[{SYMBOL} {Report Type} — {YYYY-MM-DD}]
      #h(1fr)
      #text(size: 8pt, fill: luma(120))[Page #counter(page).display()]
    ]
  },
)
#set text(font: "New Computer Modern", size: 10pt)
#set par(justify: true, leading: 0.65em)
#set heading(numbering: "1.1")

// — Helper: colored sentiment badge —
#let sentiment-badge(label, color) = box(
  fill: color.lighten(80%),
  inset: (x: 6pt, y: 3pt),
  radius: 3pt,
  text(weight: "bold", size: 9pt, fill: color)[#label]
)

// — Title block —
#align(center)[
  #text(size: 22pt, weight: "bold")[{SYMBOL} — {Company Name}]
  #v(4pt)
  #text(size: 11pt, fill: luma(80))[{Report Type} Report — {Month Day, Year}]
  #v(4pt)
  // Use sentiment-badge with the appropriate color:
  //   green for Bullish, red for Bearish, orange for Neutral
  #sentiment-badge("{Bullish/Bearish/Neutral}", {green/red/orange})
  #h(6pt)
  // Confidence badge: green for High, orange for Medium, red for Low
  #sentiment-badge("Confidence: {High/Medium/Low}", {green/orange/red})
  #v(6pt)
  #line(length: 60%, stroke: 0.5pt + luma(200))
]

// — Executive Summary (highlighted box) —
#v(8pt)
#block(
  fill: luma(245),
  inset: 12pt,
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", size: 11pt)[Executive Summary]
  #v(4pt)
  {2-3 sentence TL;DR here}
]
#v(8pt)

// — "What Changed" box (include ONLY for follow-up analyses) —
// Uncomment and populate if this is a follow-up to a prior report.
// #block(
//   fill: rgb("#e8f0fe"),
//   inset: 12pt,
//   radius: 4pt,
//   width: 100%,
// )[
//   #text(weight: "bold", size: 11pt)[What Changed Since {Prior Date}]
//   #v(4pt)
//   - *Price:* {prior price} → {current price} ({+/- %})\
//   - *Key developments:* {summary}\
//   - *Prior scenarios:* {which played out}\
//   - *Conviction:* {Higher/Lower/Unchanged} — {rationale}
// ]
// #v(8pt)

// ============================================================
// Analysis Sections
// ============================================================
// Advance the heading counter so numbered sections start at 2,
// matching the methodology (Executive Summary = Section 1 but
// rendered above as an unnumbered callout block).
#counter(heading).update(1)

= Current Price & Recent Price Action
// Content as paragraphs, lists, and tables.

== Earnings Reaction History
#figure(
  table(
    columns: 5,
    align: (left, center, center, center, center),
    stroke: 0.5pt + luma(200),
    table.header[*Quarter*][*EPS*][*Revenue*][*YoY Growth*][*Stock Move*],
    // ...rows...
  ),
  caption: [Earnings Reaction History],
)

= Technical Snapshot
// Key MAs, RSI, support/resistance, volume trends.

== Relative Strength (Brief)
// Brief note on whether the stock is leading or lagging sector/market.
// Full relative-performance table is in Section 16 (Relative Strength Dashboard).

== Seasonality & Historical Patterns
// Calendar-month tendencies, pre/post-earnings drift, seasonal drivers.

= Upcoming Catalysts
// Earnings dates, product launches, conferences, regulatory decisions.

= Fundamental Picture
== Positives
// Revenue/earnings growth, margin expansion, strategic wins.

== Negatives
// Risks, headwinds, competitive threats.

== Earnings Quality & Accounting Flags
// GAAP vs adjusted EPS spread, CFO vs net income, revenue recognition, auditor changes.

== Revenue Concentration & Supply Chain
// Top customer %, geographic breakdown, supplier dependencies.

== Balance Sheet & Debt Profile
// D/E, net debt, interest coverage, maturities, credit rating.

== Management & Governance
// CEO tenure, C-suite turnover, compensation alignment, governance flags.

= Valuation & Peer Comparison
== Valuation Multiples
// P/E, P/S, EV/EBITDA, PEG vs. 5-year historical averages.

== Peer Benchmarking
// Use table() for peer comparison grid.

= Dividends & Capital Returns
// Yield, payout ratio, dividend growth, buybacks.

= Short Interest & Float Dynamics
// Short interest, days to cover, squeeze potential.

= Options Activity
// Put/call ratio, unusual flow, IV vs HV, max pain, GEX, IV term structure.

= Insider & Institutional Activity
// Insider buys/sells, 13F changes, activist involvement.

= Analyst Consensus
// Coverage count, rating distribution, price target range.

= Online & Social Sentiment
// Reddit, StockTwits, X, news tone.

= Macro/Sector Context
// Interest rates, Fed policy, sector rotation, regulation.

= Near-Term Outlook
// Use a 3-column grid for Bull / Bear / Base scenarios:
#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 8pt,
  block(fill: green.lighten(90%), inset: 10pt, radius: 4pt)[
    #text(weight: "bold")[Bull Case ({X}%)]
    // Triggers, price target range.
  ],
  block(fill: red.lighten(90%), inset: 10pt, radius: 4pt)[
    #text(weight: "bold")[Bear Case ({X}%)]
    // Triggers, downside level.
  ],
  block(fill: orange.lighten(90%), inset: 10pt, radius: 4pt)[
    #text(weight: "bold")[Base Case ({X}%)]
    // Expected trading range.
  ],
)

// — Key risk / catalyst callout —
#v(8pt)
#block(
  fill: yellow.lighten(85%),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold")[Biggest Risk:] {risk} \
  #text(weight: "bold")[Biggest Catalyst:] {catalyst}
]

= Trade Setup

// Trade setup callout box
#block(
  fill: blue.lighten(90%),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold")[Directional Bias:] {Long/Short/Neutral} — {High/Moderate/Low} conviction \
  #text(weight: "bold")[Entry Zone:] {price range} \
  #text(weight: "bold")[Stop-Loss:] {level} ({rationale}) \
  #text(weight: "bold")[Primary Target:] {target} #h(12pt) #text(weight: "bold")[Stretch Target:] {target} \
  #text(weight: "bold")[Risk/Reward:] {X}:1 \
  #text(weight: "bold")[Position Size:] {Full/Half/Starter} \
  #text(weight: "bold")[Timeframe:] {days/weeks/months}
]

= Relative Strength Dashboard
#figure(
  table(
    columns: 5,
    align: (left, center, center, center, center),
    stroke: 0.5pt + luma(200),
    table.header[*Timeframe*][*{SYMBOL}*][*SPY*][*{Sector ETF}*][*vs. SPY*],
    // ...rows for 1W, 1M, 3M, YTD...
  ),
  caption: [Relative Strength vs. Benchmarks],
)
// Relative trend commentary, correlation shifts.

= Liquidity & Tradability
// Market cap tier, avg daily volume, float, bid-ask, options liquidity.
// Keep brief for large-caps; expand for mid/small/micro-caps.

= Data Quality & Confidence
// Flag stale data, conflicts, gaps.

// ============================================================
// Disclaimer & Sources
// ============================================================

#pagebreak(weak: true)
#v(12pt)
#line(length: 100%, stroke: 0.5pt + luma(200))
#v(4pt)
#text(size: 8pt, fill: luma(120))[
  _This is informational analysis only, not financial advice.
  All data sourced from publicly available information as of {date}.
  Figures may be delayed or subject to revision._
]

#heading(numbering: none)[Sources]
// Numbered list of sources with URLs.
