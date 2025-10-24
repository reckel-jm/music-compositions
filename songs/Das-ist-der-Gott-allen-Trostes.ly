\version "2.24.1"

%category: song
%year: 2023

\header {
  title = "Das ist der Gott allen Trostes"
  composer = "Jan Martin Reckel"
  % Voreingestellte LilyPond-Tagline entfernen
  tagline = ##f
}

\paper {
  #(set-paper-size "a4")
  
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
    \Voice
    \consists "Melody_engraver"
    \override Stem #'neutral-direction = #'()
  }
}

global = {
  \key d \major
  \numericTimeSignature
  \time 3/4
  \partial 4.
}

chordNames = \chordmode {
  \global
  % Akkorde folgen hier.
  
}

sopranoVoice = \relative c' {
  \global
  % Die Noten folgen hier.
  a8 d e | fis4. d8 g fis | e4 e e8 fis | g4. g8 fis e | d2 d8 cis | b4. b8 d b | a4 d d8 cis | 
  d4 e fis | e4. \breathe 
  a,8 d e | fis4. d8 g fis | e4 e e8 fis | g4. g8 fis d | b2 b8 cis | d4. d8 e e | fis4 d d8 cis |
  b4. e8 d cis | d4. \breathe 
  
  d8 fis a | b2 a8 g | g4 fis8 d fis a | b4. b8 a g | fis4. 
  d8 fis a | b2 a8 g | 
  g4 fis2~ | fis4. b,8 b8 cis | d4. cis8 d fis | e2 d4 | d1~ | d4. \bar "|." 
}

verseOne = \lyricmode {
  \set stanza = "1."
  % Liedtext folgt hier.
  In die -- ser Welt Pro -- ble -- me viel sind, we -- nig Hoff -- nung weit und breit.
  Men -- schen su -- chen nach Er -- lö -- sung, je -- mand der sie be -- freit.
  
  Doch in der Dun -- kel -- heit gibt's Hoff -- nung, Wor -- te aus ver -- gang -- ner Zeit.
  Kün -- den al -- len fro -- he Bot -- schaft. Es gibt Gott, er hilft auch heut.
  
  Das ist der Gott al -- len Tros -- tes. Das ist der Gott, der mich ver -- steht. 
  Das ist der Gott al -- len Tros -- tes, der auch in schwe -- ren Zei -- ten mit mir geht.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  % Liedtext folgt hier.
  Er -- scheint dein Le -- ben sinn- und trost -- los, sehnst dich nach Zu -- frie -- den -- heit,
  brauchst du nicht mehr zu ver -- zwei -- feln,
  denn Gott geht mit all -- zeit.
  In Je -- sus kam er selbst zur Er -- de, kennt auch dei -- ne Sor -- gen gut.
  Gott ist stark, ein treu -- er Hel -- fer,
  sich' -- rer Halt in gro -- ßer Not.
}

verseThree = \lyricmode {
  \set stanza = "3."
  % Liedtext folgt hier.
  Wir prei -- sen Gott für sei -- ne Gü -- te, 
  be -- ten dich, den Schö -- pfer an.
  Stau -- nend ste -- hen wir nun vor dir: Gro -- ßes hast du ge -- tan.
  _ Dei -- ne Macht, sie kennt kein En -- de,
  wir ver -- trau -- en stets da -- rauf.
  Du bist uns -- 're ew' -- ge Hoff -- nung,
  Hil -- fe kommt von dir zu Hauf!
}

chordsPart = \new ChordNames \chordNames

sopranoVoicePart = \new Staff \with {
  instrumentName = ""
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
