\version "2.24.3"

%category: song
%year: 2024

\header {
  title = "Sei nicht stolz auf das, was du bist"
  subtitle = "nach 1. Korinther 1,31"
  composer = "Jan Martin Reckel"
  % Voreingestellte LilyPond-Tagline entfernen
  tagline = ##f
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

sopranoVoice = \relative c' {
  \global
  \dynamicUp
  % Die Noten folgen hier.
  d8 e | fis4 fis g4 fis8 e | a2. \breathe
  d,8 e | fis4 fis g4 fis8 e | e2. \breathe 
  d8 e | fis4 fis g  fis8 g | a4 d b \breathe
  d,8 e | fis4 fis4 g4 fis8 e | d2. 
  
  fis8( g ) | a8 a a a d,4. d8 | b' a g fis e4 d8( e ) |
  fis4 fis g4 fis8( e ) | e2. r4
  a8 a a a d,4. d8 | b' a g fis e4 d8( e ) | 
  fis4 fis fis8 a g fis | e4 e d4
}

verseOne = \lyricmode {
  \set stanza = "1."
  % Liedtext folgt hier.
  Sei nicht stolz auf das, was du bist,
  denn nur Gott gut und hei -- lig ist.
  Su -- che ihn, so lang er sich fin -- den lässt,
  dann kommt Hoff -- nung, Frie -- de und Freud.
  
  Denn wer sich rüh -- men will, 
  der rüh -- me sich des Herrn;
  denn er ist uns nicht fern.
  Wer nun an ihn glaubt, 
  und fest auf ihn ver -- traut,
  der hat sein Le -- ben nicht auf 
  Sand ge -- baut.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  % Liedtext folgt hier.
  Men -- schen su -- chen Glück bei sich selbst,
  doch ein Mensch al -- lein sich nicht hält.
  Chris -- tus Je -- sus kam ja auf die -- se Welt,
  um zu ge -- ben, was uns noch fehlt.
}

verseThree = \lyricmode {
  \set stanza = "3."
  % Liedtext folgt hier.
  Sün -- der, sie doch dei -- ne Schuld an,
  Je -- sus hat sie weg -- ge -- tan. _
  Je -- dem, der nun um -- kehrt und an ihn glaubt,
  tut sich heut die Him -- mels -- tür auf.
  \set ignoreMelismata = ##t Da -- rum \unset ignoreMelismata
}

\score {
  \new Staff \with {
    instrumentName = ""
    shortInstrumentName = ""
    midiInstrument = "choir aahs"
  } { \sopranoVoice }
  \addlyrics { \verseOne }
  \addlyrics { \verseTwo }
  \addlyrics { \verseThree }
  \layout { }
  \midi {
    \tempo 4=100
  }
}
