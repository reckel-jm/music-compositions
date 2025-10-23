\version "2.24.0"

\header {
  title = "Das ist Gott, der mich sieht"
  subtitle = "nach 1. Mose 16,13"
  composer = "Jan Martin Reckel"
  % Voreingestellte LilyPond-Tagline entfernen
  tagline = ##f
}

\layout {
  \context {
    \Voice
    \consists "Melody_engraver"
  }
}

\paper {
  page-count = 1
  #(set-paper-size "a4")
  indent = 0
  system-system-spacing = #'((padding . 3) (basic-distance . 8))
  % Schönere Schriften
  myStaffSize = #20
  #(define fonts
  (make-pango-font-tree
   "Cambria"
   "Calibri"
   "Consolas"
   (/ myStaffSize 20)))
}

global = {
  \key e \minor
  \time 4/4
  \partial 4
}

chordNames = \chordmode {
  \global
  \germanChords
  % Akkorde folgen hier.
  r4 | e2:m b:m | e2:m b:m | e2:m d | e:m b:7 |  
  e2:m b | e2:m b | e2:m d | g g:7 | c d | g c | a:m d | g e | a:m d | g2 c | a:m d4 b:m | e2.:m d4 | 
  g2 d | g c | d1 | g2 d | g2 d | g c | d b:7 | e1:m~ | e2.:m 
}

sopranoVoiceStanza = \relative c' {
  \global
  \dynamicUp
  % Die Noten folgen hier.
  b4 | e g fis b | g fis8( e ) fis4. \breathe fis8 | g4 e fis d | b2. \breathe b4 |
  e g fis b | g fis8( e ) fis4. \breathe fis8 | g4 g a a | b2. \breathe b4 |
  c c fis, fis | b4 b8( b ) e,4. \breathe e8 | a4 g fis g8 a | b2. \breathe b4 |
  c4 c fis, fis | b4 b4 e,4. \breathe e8 | a4 g fis d | e2. \breathe
}

sopranoVoiceRefrain = \relative c' {
  d8 d8 | g4 g8 g8 a4 a8 c | b a g fis e4 e8 e | fis4 a g a | b2. 
  d,8 d8 | g4 g8 g8 a4 a8 c | b a g fis e4 fis8( e ) | fis4 a g fis | e1~ | e2. \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  % Liedtext folgt hier.
  - Ha -- gar einst Magd Sa -- rais war, 
  doch litt sie dort sehr schwer.
  Die Flucht als einz' -- ger \set ignoreMelismata = ##t Aus -- weg  er -- schien, \unset ignoreMelismata 
  ohn' Hil -- fe war sie mehr.
  Doch plötz -- lich in der Wüs -- ten -- not kommt 
  Got -- tes En -- gel zu ihr:
  „Sei furcht -- los, Ha -- gar, nicht ver -- zagt!
  Der Herr geht selbst mit dir.“.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  % Liedtext folgt hier.
  Wir Men -- schen leb -- ten oh -- ne Gott, \unset ignoreMelismata 
  so wur -- de Leid stets mehr.
  Wir such -- ten Glück bei je -- der -- mann,
  doch täusch -- ten wir uns sehr.
  Gott vie -- le Ma -- le zu uns sprach:
  Kehrt um zu mir, kommt doch her.
  Ich geb euch was ihr wirk -- lich braucht,
  sonst bleibt ihr im -- mer leer.
}

verseThree = \lyricmode {
  \set stanza = "2."
  % Liedtext folgt hier.
  Die Men -- schen leb -- ten oh -- ne Gott, \unset ignoreMelismata 
  so wur -- de Leid stets mehr.
  Wir such -- ten Glück bei je -- der -- mann,
  doch täusch -- ten wir uns sehr.
  Gott vie -- le Ma -- le zu uns sprach:
  Kehrt um zu mir, kommt doch her.
  Ich geb euch was ihr wirk -- ich braucht,
  sonst bleibt ihr im -- mer leer.
}

verseThree = \lyricmode {
  \set stanza = "3."
  % Liedtext folgt hier.
  Gott schließ -- lich wur -- de sel -- ber Mensch,
  in Chris -- tus kam zur Welt.
  Er heil -- te, lehr -- te, trös -- te -- te,
  tat das was wirk -- lich zählt.
  \set ignoreMelismata = ##t Die größ -- te Ga -- be Gott für uns gab  \unset ignoreMelismata
  als Chris -- tus  starb an dem Kreuz
  für uns -- re Schuld, er Heil er -- warb,
  wer glaubt an ihn, be -- reut.
}

verseFour = \lyricmode {
  \set stanza = "4."
  % Liedtext folgt hier.
  Auch heu -- te noch sind wir ge -- plagt von Not und Her -- ze -- leid.
  Vie -- les ver -- spricht Zu -- frie -- den -- heit, doch was wirk -- lich be -- freit?
  Wie Gott einst zu der Ha -- gar kam, so kommt er auch heut zu dir.
  Er klopft an dei -- nem Her -- zen an,
  komm, öff -- ne ihm die Tür.
}

verseRefrain = \lyricmode {
  \set stanza = "1-3" Das ist Gott, der mich sieht und der mei -- ne We -- ge kennt.
  Das ist Gott, der mich ver -- steht.
  
  Das ist Gott, der mich liebt,
  und bei mei -- nem Na -- men nennt.
  „El Roi“, der mit mir geht.
}

verseRefrainTwo = \lyricmode {
  \set stanza = "4" Das ist Gott, der dich sieht und der dei -- ne We -- ge kennt.
  Das ist Gott, der dich ver -- steht.
  
  Das ist Gott, der dich liebt,
  und bei dei -- nem Na -- men nennt.
  „El Roi“, der mit dir geht.
}

chordsPart = \new ChordNames \chordNames

sopranoVoicePart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "choir aahs"
} { \sopranoVoiceStanza \sopranoVoiceRefrain }
\addlyrics { \verseOne \verseRefrain }
\addlyrics { \verseTwo }
\addlyrics { \verseThree }
\addlyrics { \verseFour \verseRefrainTwo }
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
