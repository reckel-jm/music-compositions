\version "2.24.3"

%category: song
%year: 2025

\header {
  dedication = "Anlässlich einer Hochzeit"
  title = "Ein Mann und eine Frau"
  subtitle = "Segenslied zur Ehe"
  composer = "Jan Martin Reckel"
  % LilyPond-Standard-Tagline entfernen
  tagline = "Lizenzierung: MIT oder CC0"
}

global = {
  \key d \major
  \time 4/4
  \partial 4
}

\paper {
  #(set-paper-size "a5")
  
  indent = 0
  system-system-spacing.padding = #3
  markup-system-spacing.padding = #3
  
  myStaffSize = #20
  #(define fonts
  (make-pango-font-tree
   "Carlito"
   "Liberation"
   "DejaVu"
   (/ myStaffSize 20)))
}

chordNames = \chordmode {
  \global
  % Akkorde folgen hier.
  \skip4 | d2 a | d1 | g2 e:m | a1 |
  b2:m a | d2 d:7 | g e:m | a2 d:7 |
  g1 | d | e2:m fis | b2:m d:7 |
  g1 | fis2:m b:m | e:m a | d2. 
}

sopranoVoice = \relative c' {
  \global
  \dynamicUp
  % Die Noten folgen hier.
  a4 | d d e e | \slurDashed fis4( fis2 ) fis4 | g fis e d | e2. \breathe 
  a,4 | d d e e | \slurDashed fis4( fis2 ) fis4 | g fis g a | a2. \breathe 
  d,4 | b' b a g | a4 fis2 fis4 | g fis e fis | d2. \breathe
  a'4 | b b a g | a4 d2\fermata fis,4 | g fis e d | d2. \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  % Liedtext folgt hier.
  Ein Mann und ei -- ne Frau
  sa -- gen ei -- nan -- der Ja.
  So ist es Got -- tes Plan,
  und der ist wun -- der -- bar!
  Gott seg -- ne eu -- re E -- he 
  in die -- ser wil -- den Zeit.
  Auf dass sie fest be -- ste -- he,
  bis hin zur E -- wig -- keit.

}

verseTwo = \lyricmode {
  \set stanza = "2."
  % Liedtext folgt hier.
  Was Gott nun hat \set ignoreMelismata = ##t ver -- bun -- den, \unset ignoreMelismata 
  kein Mensch mehr schei -- den soll.
  Und auch in \set ignoreMelismata = ##t  schwe -- ren Stun -- den \unset ignoreMelismata
  bleibt euch der Herr stets treu.
  So geht ent -- schlos -- sen vor -- wärts, 
  ge -- mein -- sam Schritt für Schritt!
  In al -- len Le -- bens -- la -- gen 
  geht der Herr sel -- ber mit.
}

verseThree = \lyricmode {
  \set stanza = "3."
  % Liedtext folgt hier.
  Nur Je -- sus wah -- re \set ignoreMelismata = ##t Hof -- fnung, 
  Lie -- be gibt, Zu -- ver -- sicht.
  Der Fels er in der Bran -- dung, 
  die Wahr -- heit und das Licht!
  Ver -- traut auf den Er -- lö -- ser, 
  lasst ihn stets bei euch ein.
  Dann wird auch eu -- re E -- he 
  ein Ort des Se -- gens sein.
}

chordsPart = \new ChordNames \chordNames

sopranoVoicePart = \new Staff \with {
  midiInstrument = "choir aahs"
} { \sopranoVoice }
\addlyrics { \verseOne }
\addlyrics { \verseTwo }
\addlyrics { \verseThree }

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