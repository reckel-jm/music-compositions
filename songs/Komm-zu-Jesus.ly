\version "2.22.1"

\header {
  title = "Komm zu Jesus"
  subtitle = "nach Johannes 6,37"
  composer = "Jan Martin Reckel"
  tagline = ##f
}

\paper {
  #(set-paper-size "a5")
    page-count = 1
  myStaffSize = #17
  #(define fonts
  (make-pango-font-tree
   "Cambria"
   "Calibri"
   "Consolas"
   (/ myStaffSize 20)))
  
  system-system-spacing =
    #'((basic-distance . 20)
       (minimum-distance . 12)
       (padding . 5)
       (stretchability . 60)) 
}

\layout {
    indent = #0
  \context {
    \Voice
    \consists "Melody_engraver"
    \override Stem #'neutral-direction = #'()
  }
}

global = {
  \key d \major
  \time 4/4
}


chordNames = \chordmode {
  \global
  % Akkorde folgen hier.
  d2 a | g d | g a | d1 |
  d2 a | g d | g a | d1 |
  g2 d | e4:m a d2 | g b:m |
  e4:m e a2 |
  d2 a | g d | g a | d1 |
}

sopranoVoice = \relative c' {
  \global
  \dynamicUp
  % Die Noten folgen hier.
  fis4. fis8 e4 a | d,4. d8 d4 a | b4. d8 d4 cis | d1 |
  fis4. fis8 e4 a | d,4. d8 d4 a | b4. d8 d4 cis | d1 |
  d'4. d8 d4 a | g4. a8 fis4 d | d'4. d8 d4 a | b d cis2 |
  fis,4. fis8 e4 a | d,4. d8 d4 a | b4. d8 d4 cis | d1 | \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  % Liedtext folgt hier.
  „Kommt zu mir, hier dürft ihr blei -- ben“, so einst Je -- su Wort.
    Er zu al -- len Men -- schen sprach es,
    schick -- te sie nicht fort.

    Kommt zu Je -- sus, es noch heu -- te
    fest für dich ge -- schrie -- ben steht!
    Je -- der ist jetzt ein -- ge -- la -- den.
    Kom -- me im Ge -- bet.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  % Liedtext folgt hier.
  Je -- su Lie -- be un -- be -- schreib -- lich,
    so un -- end -- lich groß!
    Gab sein Le -- ben für uns selbst hin,
    seht doch, wel -- cher Trost!

    Bei ihm ist ein Ort für Sün -- der!
    Der Er -- lö -- ser für die Welt.
    Die -- ser Ort, er ist so wert -- voll
    zahl -- bar nicht mit Geld
}

verseThree = \lyricmode {
  \set stanza = "3."
  % Liedtext folgt hier.
  Je -- sus klop -- fet an die Tü -- re,
  bit -- tet: „Lass mich rein!“.
  Je -- des Herz, das sich ihm öf -- fnet,
  dort er froh kehrt ein.

  Oh, wie trau -- rig, wenn's zu spät ist,
  Und die Tür ge -- schlos -- sen bleibt.
  Wäh -- le heu -- te, es gibt Hof -- fnung
  Bis in E -- wig -- keit!
}

sopranoVoicePart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "choir aahs"
} { \sopranoVoice }
\addlyrics { \verseOne }
  \addlyrics { \verseTwo }
  \addlyrics { \verseThree }

chordsPart = \new ChordNames \chordNames


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
