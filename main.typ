#import "lib.typ": *
#import "@preview/pergamon:0.8.0": *

// #set text(lang: "de")

#show: saar.with(
  title: "Lorem Ipsum Dolor Sit Amet",
  author: "Jane Doe",
  degree-program: "b-cs-info",
  matriculation-number: "1234567",
  supervisors: (
    ("Supervisors", "Prof. Dr. First Supervisor", "Prof. Dr. Second Supervisor"),
    // ("Additional advisor", "Dr. Helpful Advisor")
  ),
  date: "31.12.2026",
  // mode: "print",

  abstract: [
    #lorem(120)

    #lorem(80)
  ],

  acknowledgments: [
    #lorem(60)

    #lorem(40)
  ],
)


#add-bib-resource(read("custom.bib"))

#let sample-figure(title, body) = box(
  width: 100%,
  inset: 1.1em,
  fill: luma(248),
  stroke: (paint: luma(215), thickness: 0.6pt),
)[
  #align(center)[
    #text(font: "Open Sans", weight: "bold", size: 12pt)[#title]
    #v(0.4em)
    #text(size: 10pt)[#body]
  ]
]


= Introduction <sec:introduction>

#lorem(150)

#lorem(120) #cite("doe-roe-2020-lorem")

#lorem(100) See @sec:background and @tab:lorem.

= Background <sec:background>

#lorem(140)

#citet("musterfrau-1990-book") #lorem(60)

== Related Work

#lorem(120) #cite("roe-etal-2015-consectetur")

#lorem(90)

#figure(kind: table, caption: [Lorem ipsum dolor sit amet.])[
  #table(
    columns: (1.5fr, 2.4fr, 1.4fr),
    inset: 6pt,
    table.header([Lorem], [Ipsum], [Dolor]),
    [Sit amet], [Consectetur adipiscing], [Elit],
    [Sed do], [Eiusmod tempor], [Incididunt],
    [Ut labore], [Et dolore magna], [Aliqua],
    [Ut enim], [Ad minim veniam], [Quis],
  )
] <tab:lorem>

= Methods

#lorem(130)

== Lorem Ipsum

#lorem(110)

#figure(caption: [Consectetur adipiscing elit.])[
  #sample-figure(
    [Lorem ipsum dolor sit amet],
    [Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.],
  )
] <fig:lorem>

#lorem(80) As shown in @fig:lorem, #lorem(30)

=== Dolor Sit Amet

#lorem(100)

==== Consectetur
#lorem(70)

==== Adipiscing
#lorem(70)

=== Sed Do Eiusmod

#lorem(120) #cite("doe-2023-magna")

= Results

#lorem(150)

#figure(kind: table, caption: [Tempor incididunt ut labore.])[
  #table(
    columns: (1.6fr, 1.2fr, 1.4fr, 1.4fr),
    inset: 6pt,
    table.header([Lorem], [Ipsum], [Dolor], [Sit]),
    [Amet], [+3.8], [[+2.1, +5.4]], [Consectetur],
    [Adipiscing], [+2.9], [[+1.0, +4.6]], [Elit],
    [Sed do], [+1.2], [[-0.1, +2.5]], [Eiusmod],
    [Tempor], [+0.6], [[-1.4, +2.2]], [Incididunt],
  )
] <tab:results>

#lorem(100) See @tab:results.

#lorem(150)

= Conclusion

#lorem(120)

#lorem(90)

#print-saar-bibliography()
