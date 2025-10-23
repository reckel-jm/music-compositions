\version "2.24.3"

\header {
  title = "Nun gibt es keine Verdammnis mehr"
  composer = "Jan Martin Reckel"
  % Voreingestellte LilyPond-Tagline entfernen
  tagline = ##f
}

\paper {
  #(set-paper-size "a5")
  
  indent = 0
  system-system-spacing.padding = #3
  markup-system-spacing.padding = #3
  
  myStaffSize = #20
  #(define fonts
  (make-pango-font-tree
   "Cambria"
   "Calibri"
   "Consolas"
   (/ myStaffSize 20)))
}

\layout {
  \context {
    \Score
    \remove "Bar_number_engraver"
  }
}

global = {
  \key d \major
  \time 4/4
  \partial 4
}

chordNames = \chordmode {
  \global
  % Akkorde folgen hier.
  r4 | d1 | a2 d4 b:m | d2 fis4:m g | e:m a d4 d:7 |
  g2 d | e4:m a d2 | d2 fis4:m g8 b:m | e4:m a d4 
}

sopranoVoice = \relative c' {
  \global
  \dynamicUp
  % Die Noten folgen hier.
  d8( e ) | fis4 g a g8( fis ) | e4 d8( e ) fis4 \breathe d8( e ) | fis4 g a g8( fis ) | 
  e4 d8( cis ) d4 \breathe 
  d4 | b'4 b a fis | g4 a fis \breathe d8( e ) | fis4 g a g8( fis ) | 
  e4 d8( cis ) d4 \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  % Liedtext folgt hier.
  Nun gibt es \set ignoreMelismata = ##t 
  kei -- ne Ver -- damm -- \unset ignoreMelismata nis 
  mehr,
  für die in Chris -- tus Je -- sus sind.
  Die da nicht wan -- deln nach dem Fleisch,
  \set ignoreMelismata = ##t son -- dern 
  \unset ignoreMelismata
  die da wan -- deln nach dem Geist.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  % Liedtext folgt hier.
  Wo Chris -- tus Je -- sus ist der Herr,
  da Dun -- kel -- heit be -- steht nicht mehr.
  Die Schuld ist weg, die Schat -- ten fliehn,
  wenn Sün -- der glau -- bend kom -- \set ignoreMelismata = ##t men zu ihm.
  \unset ignoreMelismata
}

verseThree = \lyricmode {
  \set stanza = "3."
  % Liedtext folgt hier.
  Denn Gott ja sei -- ne Lieb' be -- wies,
  als er für uns sein Le -- ben ließ.
  Er sieg -- te ü -- ber Fin -- ster -- nis,
  hat uns ge -- bracht das Pa -- ra -- dies.
}

verseFour = \lyricmode {
  \set stanza = "4."
  % Liedtext folgt hier.
  Drum Tod, du hast kein' Sta -- chel mehr,
  denn Chris -- tus siegt, er ist der Herr.
  Wer um -- kehrt, und nun an ihn glaubt,
  der hat auf fes -- ten Fels ge -- baut.
}

chordsPart = \new ChordNames \chordNames

sopranoVoicePart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "choir aahs"
} { \sopranoVoice }
\addlyrics { \verseOne }
\addlyrics { \verseTwo }
\addlyrics { \verseThree }
\addlyrics { \verseFour }

\score {
  <<
    \chordsPart
    \sopranoVoicePart
  >>
  \layout { }
  \midi {
    \tempo 4=100
  }
}
