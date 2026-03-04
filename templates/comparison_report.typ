// ============================================================
// Trading Analysis — Comparative Report Template
// ============================================================
// Usage: Copy this template when generating a comparison report
// for two or more symbols. Replace all {PLACEHOLDER} tokens.
// File naming: {SYM1}_vs_{SYM2}_{YYYY-MM-DD}.typ
//   (3+ symbols: {SYM1}_vs_{SYM2}_vs_{SYM3}_{YYYY-MM-DD}.typ)
// ============================================================
//
// Placeholder tokens used in this template (verify all are
// replaced before compiling):
//   {SYM1}                 — First symbol ticker
//   {SYM2}                 — Second symbol ticker
//   {Report Type}          — Asset-class label for header/title
//   {YYYY-MM-DD}           — Report date (ISO format, header)
//   {Month Day, Year}      — Report date (long format, title)
//   {DATE}                 — Report date (disclaimer)
//   {CATALYST_DESCRIPTION} — Per-symbol catalyst description
//   {RISK_DESCRIPTION}     — Per-symbol risk description
//   {OVERALL_PICK}         — Verdict: overall pick symbol
//   {RATIONALE}            — Verdict rationale text
// ============================================================
//
// Extending for 3+ symbols:
//   - Add a column to every table() (columns: 4+ instead of 3)
//   - Add a sentiment-badge() per extra symbol on the cover
//   - Update the header text to include all symbols
//     (e.g., "{SYM1} vs {SYM2} vs {SYM3}")
//   - Add a grid() column for each extra symbol in side-by-side
//     sections (Catalysts & Risks, Price Action)
//   - Add {SYM3}, {SYM4}, etc. placeholder tokens as needed
// ============================================================

// — Page, font & heading setup —
#set page(
  paper: "us-letter",
  margin: (x: 1in, y: 1in),
  header: context {
    if counter(page).get().first() > 1 [
      #text(size: 8pt, fill: luma(120))[{SYM1} vs {SYM2} {Report Type} — {YYYY-MM-DD}]
      #h(1fr)
      #text(size: 8pt, fill: luma(120))[Page #counter(page).display()]
    ]
  },
)
#set text(size: 10pt)
#set par(justify: true, leading: 0.65em)
// Flat numbering — comparative reports have no sub-sections
#set heading(numbering: "1.")

// — Helper: colored sentiment badge —
#let sentiment-badge(label, color) = box(
  fill: color.lighten(80%),
  inset: (x: 6pt, y: 3pt),
  radius: 3pt,
  text(weight: "bold", size: 9pt, fill: color)[#label]
)

// — Title block —
#align(center)[
  #text(size: 22pt, weight: "bold")[{SYM1} vs {SYM2}]
  #v(4pt)
  #text(size: 11pt, fill: luma(80))[{Report Type} Comparative Analysis — {Month Day, Year}]
  #v(4pt)
  // Replace with actual per-symbol sentiments and colors
  // (green = Bullish, red = Bearish, orange = Neutral)
  #sentiment-badge("{SYM1}: Bullish", green)
  #h(6pt)
  #sentiment-badge("{SYM2}: Bearish", red)
  #h(6pt)
  // Replace "Medium" and orange with actual confidence and color
  // (green = High, orange = Medium, red = Low)
  #sentiment-badge("Confidence: Medium", orange)
  #v(6pt)
  #line(length: 60%, stroke: 0.5pt + luma(200))
]

// ============================================================
// Section 1: Overview Table
// ============================================================

= Overview

#figure(
  table(
    columns: 3,
    align: (left, center, center),
    stroke: 0.5pt + luma(200),
    table.header[][*{SYM1}*][*{SYM2}*],
    [Price], [], [],
    [Market Cap], [], [],
    [Sector], [], [],
    [YTD Performance], [], [],
    [Sentiment], [], [],
  ),
  caption: [Overview Comparison],
)

// ============================================================
// Section 2: Price Action & Technical Comparison
// ============================================================

= Price Action & Technical Comparison
// Momentum, relative strength, chart setup comparison.

#grid(
  columns: (1fr, 1fr),
  gutter: 12pt,
  block(fill: luma(245), inset: 10pt, radius: 4pt)[
    #text(weight: "bold")[{SYM1}]
    // Technical summary: MAs, RSI, support/resistance, volume.
  ],
  block(fill: luma(245), inset: 10pt, radius: 4pt)[
    #text(weight: "bold")[{SYM2}]
    // Technical summary: MAs, RSI, support/resistance, volume.
  ],
)

== Relative Strength Comparison
#figure(
  table(
    columns: 6,
    align: (left, center, center, center, center, center),
    stroke: 0.5pt + luma(200),
    table.header[*Timeframe*][*{SYM1}*][*{SYM2}*][*SPY*][*{SYM1} vs SPY*][*{SYM2} vs SPY*],
    [1 Week], [], [], [], [], [],
    [1 Month], [], [], [], [], [],
    [3 Months], [], [], [], [], [],
    [YTD], [], [], [], [], [],
  ),
  caption: [Relative Strength Comparison],
)

// ============================================================
// Section 3: Fundamental Comparison
// ============================================================

= Fundamental Comparison

#figure(
  table(
    columns: 3,
    align: (left, center, center),
    stroke: 0.5pt + luma(200),
    table.header[*Metric*][*{SYM1}*][*{SYM2}*],
    [Revenue Growth], [], [],
    [EPS Growth], [], [],
    [Gross Margin], [], [],
    [Operating Margin], [], [],
    [ROE], [], [],
    [Debt/Equity], [], [],
    [Dividend Yield], [], [],
    [Buyback Activity], [], [],
  ),
  caption: [Fundamental Comparison],
)

// ============================================================
// Section 4: Valuation Comparison
// ============================================================

= Valuation Comparison

#figure(
  table(
    columns: 3,
    align: (left, center, center),
    stroke: 0.5pt + luma(200),
    table.header[*Metric*][*{SYM1}*][*{SYM2}*],
    [P/E (TTM)], [], [],
    [P/E (Fwd)], [], [],
    [P/S], [], [],
    [EV/EBITDA], [], [],
    [PEG], [], [],
  ),
  caption: [Valuation Comparison],
)
// Commentary: who trades at a premium/discount, and is it justified?

// ============================================================
// Section 5: Catalysts & Risks
// ============================================================

= Catalysts & Risks

#grid(
  columns: (1fr, 1fr),
  gutter: 12pt,
  block(fill: luma(245), inset: 10pt, radius: 4pt)[
    #text(weight: "bold")[{SYM1}] \
    #text(weight: "bold")[Key Catalyst:] {CATALYST_DESCRIPTION} \
    #text(weight: "bold")[Biggest Risk:] {RISK_DESCRIPTION}
  ],
  block(fill: luma(245), inset: 10pt, radius: 4pt)[
    #text(weight: "bold")[{SYM2}] \
    #text(weight: "bold")[Key Catalyst:] {CATALYST_DESCRIPTION} \
    #text(weight: "bold")[Biggest Risk:] {RISK_DESCRIPTION}
  ],
)

// ============================================================
// Section 6: Positioning & Sentiment
// ============================================================

= Positioning & Sentiment

#figure(
  table(
    columns: 3,
    align: (left, center, center),
    stroke: 0.5pt + luma(200),
    table.header[*Metric*][*{SYM1}*][*{SYM2}*],
    [Short Interest (% Float)], [], [],
    [Put/Call Ratio], [], [],
    [Analyst Consensus], [], [],
    [Avg Price Target], [], [],
    [Social Sentiment], [], [],
  ),
  caption: [Positioning & Sentiment Comparison],
)

// ============================================================
// Section 7: Liquidity Note
// ============================================================

= Liquidity Note
// Flag any differences in market cap tier, volume, float, bid-ask spread,
// or options liquidity between the symbols, and practical implications.

#figure(
  table(
    columns: 3,
    align: (left, center, center),
    stroke: 0.5pt + luma(200),
    table.header[*Metric*][*{SYM1}*][*{SYM2}*],
    [Market Cap Tier], [], [],
    [Avg Daily Volume], [], [],
    [Float], [], [],
    [Options Liquidity], [], [],
  ),
  caption: [Liquidity Comparison],
)

// ============================================================
// Section 8: Verdict
// ============================================================

= Verdict

#figure(
  table(
    columns: 3,
    align: (left, center, center),
    stroke: 0.5pt + luma(200),
    table.header[*Dimension*][*{SYM1}*][*{SYM2}*],
    [Growth], [], [],
    [Value], [], [],
    [Momentum], [], [],
    [Risk], [], [],
    [#text(weight: "bold")[Overall]], [], [],
  ),
  caption: [Verdict — Dimension Rankings],
)

// Overall pick and rationale:
#block(
  fill: blue.lighten(90%),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold")[Overall Pick:] {OVERALL_PICK} \
  {RATIONALE}
]

// ============================================================
// Section 9: Data Quality Note
// ============================================================

= Data Quality Note
// Note any data gaps, staleness, or source conflicts that differ between
// the symbols (especially relevant for large-cap vs. small-cap comparisons).

// Brief commentary on overall data quality for this comparison.

#figure(
  table(
    columns: 3,
    align: (left, center, center),
    stroke: 0.5pt + luma(200),
    table.header[*Data Point*][*{SYM1}*][*{SYM2}*],
    [Data Freshness], [], [],
    [Coverage Depth], [], [],
    [Source Conflicts], [], [],
  ),
  caption: [Data Quality Comparison],
)

// ============================================================
// Disclaimer & Sources
// ============================================================

#pagebreak(weak: true)
#v(12pt)
#line(length: 100%, stroke: 0.5pt + luma(200))
#v(4pt)
#text(size: 8pt, fill: luma(120))[
  #emph[This is informational analysis only, not financial advice.
  All data sourced from publicly available information as of {DATE}.
  Figures may be delayed or subject to revision.]
]

#heading(numbering: none)[Sources]
// Numbered list of sources with URLs.
