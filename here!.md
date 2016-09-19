---
title: Markdown examples for parsing
author: James P. Ascher
papersize: letter
layout: backspace=1in,topspace=0.5in,header=0.5in,footer=0.5in,margin=0.75in,leftmargindistance=0in,rightmargindistance=0in,width=middle,height=middle
indenting: ["yes",0.5in]
interlinespace: 5.6ex
whitespace: none
pagenumbering: state=stop
citation-style: /Users/james/lib/chicago-fullnote-no-bibliography.csl
bibliography: /Users/james/org/research.bib
headertext:
    - \hfill
    - Ascher, \pagenumber
...

\setupheads[indentnext=yes]
\setuppagenumber[number=1]
\setupalign[flushleft,nothyphenated]
\setupbodyfont[liberation,10pt]

First Example
=============

# Step 1: Expand Markdown Encoded Collations Formulas to a List of Leaves

### Input:

        4^o^: [A]^2^ B--C^4^ D^2^ [\$1--2 (-D2) signed]; 12 leaves, pp. [1--2]
        3--24

### Output option one (by gathering):

       [Gathering A:]
       4^o^: [A]^2^; 2 leaves, pp. [1--2] 3--4
       [Gathering B:]
       4^o^: B^4^ [\$1--2 signed]; 4 leaves, pp. 5--12
       [Gathering C:]
       4^o^: C^4^ [\$1--2 signed]; 4 leaves, pp. 13--20
       [Gathering D:]
       4^o^: D^2^ [\$1 signed]; 2 leaves, pp. 21--24

### Output option two (by leaf):

       [Gathering A:]
       [Quarto format]
       [A1^r^] ([1])
       [A1^v^] ([2])
       [Center of gathering]
       [A2^r^] (3)
       [A2^r^] (4)

       [Gathering B:]
       [Quarto format]
       B1^r^ (5)
       B1^v^ (6)
       B2^r^ (7)
       B2^v^ (8)
       [Center of gathering]
       [B3^r^] (9)
       [B3^v^] (10)
       [B4^r^] (11)
       [B4^v^] (12)

       [Gathering C:]
       [Quarto format]
       C1^r^ (13)
       C1^v^ (14)
       C2^r^ (15)
       C2^v^ (16)
       [Center of gathering]
       [C3^r^] (17)
       [C3^v^] (18)
       [C4^r^] (19)
       [C4^v^] (20)

       [Gathering D:]
       [Quarto format]
       D1^r^ (21)
       D1^v^ (22)
       [Center of gathering]
       [D2^r^] (23)
       [D2^v^] (24)


## Step 2: Take the by Leaf Output and an Imposition Scheme to Give Layouts

### Input:

        [the second option above] and
        Common quarto (B-C) and Common half-sheet quarto (A.D)
        [[alternatively, "A,D" would say that they are not on the same
        sheet for the next step]]

### Output:

        [Form B(o):]
        +----------+-------------+
        |B1^r^ (5) |[B4^v^] (12) |
        +----------+-------------+
        |B2^v^ (8) |[B3^r^] (9)  |
        +----------+-------------+
        [Form B(i):]
        +----------+-------------+
        |B1^v^ (6) |[B4^r^] (11) |
        +----------+-------------+
        |B2^r^ (7) |[B3^v^] (10) |
        +----------+-------------+

        [[etc. etc. I think you get the point]]

Examples
========

## With a plate and inferred last page

    4^o^: π^2^ Z--2D^4^ [\$1--2 signed]; 22 leaves, pp. 169--211 [212];
    plate [*1*]

### Output option two

    [Gathering π:]
    [Quarto format]
    π1^r^ (169)
    π1^v^ (170)
    [Center of gathering]
    π2^r^ (171)
    π2^v^ (172)

    [Gathering Z:]
    [Quarto format]
    Z1^r^ (173)
    Z1^v^ (174)
    Z2^r^ (175)
    Z2^v^ (176)
    [Center of gathering]
    [Z3^r^] (177)
    [Z3^v^] (178)
    [Z4^r^] (179)
    [Z4^v^] (180)

    [[...etc...]]

    [Gathering 2D:]
    [Quarto format]
    2D1^r^ (205)
    2D1^v^ (206)
    2D2^r^ (207)
    2D2^v^ (208)
    [Center of gathering]
    [2D3^r^] (209)
    [2D3^v^] (210)
    [2D4^r^] (211)
    [2D4^v^] ([212])

    [plate [*1*]]

## Mixed format and leaves

    4^o^ (π, 2Q--3B, 3C1) and 2^o^ (3C2): π1 2Q--3B^4^ 3C1 3C2 [\$1--2
    signed]; 43 leaves, pp. [*2*] 299-381 [382]; tables [engraved]
    1--3

### Output option two

    [Leaf π:]
    [Quarto format]
    π1^r^ ([*1*])
    π1^v^ ([*2*])

    [Gathering 2Q:]
    [Quarto format]
    [[...etc...]]

    [Leaf 2C1:]
    [Quarto format]
    2C1^r^ (279)
    2C1^v^ (280)

    [Leaf 3C2:]
    [Folio format]
    3C2^r^ (381)
    3C2^v^ ([382])

    [tables [engraved] 1--3]

## Leaves with undetermined gathering pattern, inserted page numbers, added signings, missignings

    4^o^: 4G (3 ll.) 4H--4I^4^ [\$1--2 (+4H3) signed, 4G1=4G2]; 11 leaves,
    pp. 877--890 ^χ^890 891 [*6*]

### Output option two

    [Leaves 3G:]
    [Quarto format]
    4G2^r^(*i.e.* [4G1^r^]) (877)
    4G2^v^(*i.e.* [4G1^v^]) (878)
    4G2^r^ (879)
    4G2^v^ (880)
    [4G3]^r^ (881)
    [4G3]^v^ (882)

    [Gathering 4H:]
    [Quarto format]
    4H1^r^ (883)
    4H1^v^ (884)
    4H2^r^ (885)
    4H2^v^ (886)
    [Center of gathering]
    4H3^r^ (887)
    4H3^v^ (888)
    [4H4^r^] (889)
    [4H4^v^] (890)

    [Gathering 4I:]
    [Quarto format]
    4I1^r^ (^χ^890)
    4I1^v^ (891)
    4I2^r^ ([*1*])
    4I2^v^ ([*2*])
    [Center of gathering]
    [4I3^r^] ([*3*])
    [4I3^v^] ([*4*])
    [4I4^r^] ([*5*])
    [4I4^v^] ([*6*])
