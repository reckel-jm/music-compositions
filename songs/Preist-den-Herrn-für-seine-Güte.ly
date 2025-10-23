\version "2.24.2"

\header {
  title = "Preist den Herrn, für seine Güte"
  composer = "Jan Martin Reckel"
  % Voreingestellte LilyPond-Tagline entfernen
  tagline = ##f
}

\paper {
  indent = 0
  system-system-spacing = #'((basic-distance . 12)
                             (minimum-distance . 6 )
                             (padding . 3 )
                             (stretchability . 12 ))
  markup-system-spacing.padding = #3
}

\layout {
  \context {
    \Voice
    \consists "Melody_engraver"
  }
}

global = {
  \key g \major
  \time 4/4
}

chordNames = \chordmode {
  \global
  % Akkorde folgen hier.
  g4 b:m c g | d2 g | d g | a:7 d |
  g4 b:m c g | d2 g | d2 g4 e:m | c d g2 |
  d2 g4 d | e:m b:m a d | d2 g4 c | g a:7 d2 |
  g4 d e2:m | c2 d | b e4:m a:m | e:m d g2
}

melody = \relative c'' {
  \global
  \dynamicUp
  % Die Noten folgen hier.
  g4 d e g | a a b g | a a b a | g g fis2 |
  g4 d e g | a a b g | a a b a | g fis g2 |
  a4 a b a | g fis e d | 
  a'4 a b c | b g a2 |
  b4 a g g | c b a a | b a g a | g fis g2 \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  % Liedtext folgt hier.
  Preist den Herrn für sei -- ne Gü -- te,
  sie gilt je -- den Tag uns neu.
  Gott all -- mäch -- tig, gnä -- dig hei -- lig,
  und auf e -- wig stark und treu.
  Er hat uns sein Wort ge -- ge -- ben,
  feh -- ler -- los, voll -- kom -- men gut.
  Se -- lig ist, der die -- ses hö -- ret,
  gut be -- wahrt, und es auch tut.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  % Liedtext folgt hier.
  In den schwe -- ren dunk -- len Zei -- ten gibt die Bi -- bel Zu -- ver -- sicht.
  Wenn auch vie -- les heut' nicht klar scheint, Got -- tes Wort gibt hel -- les Licht.
  Fröh -- lich lasst uns wei -- ter ge -- hen, 
  fest ge -- grün -- det auf Sein Wort.
  Än -- dern sich auch schnell die Zei -- ten,
  kei -- ne Strö -- mung reißt uns fort.
}

verseThree = \lyricmode {
  \set stanza = "3."
  % Liedtext folgt hier.
  Got -- tes Wort, es führt zu Chris -- tus.
  Got -- tes Sohn, der kam zur Welt.
  Er für uns gab hin sein Le -- ben
  gab sich selbst als Lö -- se -- geld.
  Als der Herr am Kreuz ge -- stor -- ben,
  hat die Lie -- be tri -- um -- phiert.
  Uns das e -- w'ge Heil er -- wor -- ben
  wer an Ihn glaubt wird er -- höhrt.
}

verseFour = \lyricmode {
  \set stanza = "4."
  % Liedtext folgt hier.
  Lasst Sein Wort uns wei -- ter -- ge -- ben,
  Je -- sus sprach: Es ist voll -- bracht.
  Mag es vie -- len sein nur Tor -- heit, 
  wem ge -- ret -- tet Got -- tes Kraft.
  Got -- tes Wort einst schuf die Er -- de,
  wel -- che Grö -- ße, wel -- che Macht.
  Es auch wirkt in Men -- schen -- her -- zen,
  dass sie fin -- den Je -- su Gnad'.
  
}

chordsPart = \new ChordNames \chordNames

melodyPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "choir aahs"
} { \melody }
\addlyrics { \verseOne }
\addlyrics { \verseTwo }
\addlyrics { \verseThree }
\addlyrics { \verseFour }


\score {
  <<
    \chordsPart
    \melodyPart
  >>
  \layout { }
  \midi {
    \tempo 4=100
  }
}
