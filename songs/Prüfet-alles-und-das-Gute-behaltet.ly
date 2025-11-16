\version "2.22.1"

%category: song
%year: 2025
%melody-composer: Jan Martin Reckel
%lyric-poet: Jan Martin Reckel
%copyright: Public Domain/CC0
%original-language: German

\header {
  title = "Prüfet alles und das Gute behaltet"
  subtitle = "nach 1. Thessalonicher 5,21 (Jahreslosung 2025)"
  composer = "Text und Melodie: Jan Martin Reckel"
  tagline = ##f
  copyright = "Gemeinfreies Werk (CO0)"
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
  d2 b4:m a8 d | g2 a | fis:m b:m | e:m a |
  d2 b2:m | e:m a | fis:m b:m g4 a8 d~ d2 
}

sopranoVoice = \relative c' {
  \global
  \dynamicUp
  % Die Noten folgen hier.
  d4. e8 d8 d e fis | g4 fis8( g ) e4 e \breathe | a2 d,4 d | g4 fis8 e4.~ e4 \breathe 
  d4. e8 d8( d ) e( fis ) | g4 fis8( g )  e4 e \breathe | a2 d,4 d | d4 cis8 d8~ d2 \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  % Liedtext folgt hier.
  Prü -- fet al -- les und das \set ignoreMelismata = ##t Gu -- te be -- hal -- tet. \unset ignoreMelismata
  So sagt es Got -- tes Wort.
  Wer stets  Sorg -- \set ignoreMelismata = ##t falt   zur Bi -- bel \unset ignoreMelismata hin wal -- tet
  Der hat ein' fes -- ten Hort.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  % Liedtext folgt hier.
  Al -- le Leh -- ren, al -- les,  was ver -- kün -- det
  der Bi -- bel fol -- gen muss.
  Wo hin -- zu -- \set ignoreMelismata = ##t ge -- fügt   o -- der ent -- fernt wird, \unset ignoreMelismata 
  da bringt man groß Ver -- druss.
}

verseThree = \lyricmode {
  \set stanza = "3."
  % Liedtext folgt hier.
  \set ignoreMelismata = ##t
  Da -- rum je -- der Christ soll täg -- lich drin le -- sen, \unset ignoreMelismata
  was Got -- tes Wort denn sagt.
  Dann der Heil' -- ge Geist \set ignoreMelismata = ##t wird es \unset ignoreMelismata ge -- ben,
  dass man we -- nig ver -- zagt.
}

verseFour = \lyricmode {
  \set stanza = "4."
  % Liedtext folgt hier.
  \set ignoreMelismata = ##t
  Die Bi -- bel wird dich stets füh -- ren zu Chris -- tus 
  und dem, was er \unset ignoreMelismata ge -- tan.
  Wer an ihn glaubt, der wird le -- ben,
  Gott sieht die Schuld nicht an.
}

verseFive = \lyricmode {
  \set stanza = "5."
  % Liedtext folgt hier.
  Got -- tes Wort, es blei -- bet stets die Wahr -- heit:
  Un -- fehl -- bar, hel -- les Licht.
  Es bringt dir die nö -- \set ignoreMelismata = ##t ti -- ge Klar -- heit \unset ignoreMelismata
  und es ent -- täuscht dich nicht.
}

sopranoVoicePart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "choir aahs"
} { \sopranoVoice }
\addlyrics { \verseOne }
  \addlyrics { \verseTwo }
  \addlyrics { \verseThree }
  \addlyrics { \verseFour }
  \addlyrics { \verseFive }

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
