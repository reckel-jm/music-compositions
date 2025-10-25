\version "2.24.3"
\language "deutsch"

%category: song
%year: 2024
%bible_references: 1. Korinther 16,14
%melody-composer: Jan Martin Reckel
%lyric-poet: Jan Martin Reckel

\header {
  title = "Alles, was ihr tut, geschehe in Liebe"
  subtitle = "nach 1. Korinther 16,14"
  composer = "Text und Melodie: Jan Martin Reckel"
  % Voreingestellte LilyPond-Tagline entfernen
  tagline = ##f
}

\layout {
  \context {
    \Score
    \remove "Bar_number_engraver"
  }
}

\paper {
  indent = 0
  
  myStaffSize = #20

  #(define fonts
  (make-pango-font-tree
   "Cambria"
   "Calibri"
   "Consolas"
   (/ myStaffSize 20)))
}

global = {
  \key c \major
  \time 4/4
}

chordNames = \transpose c d \chordmode {
  \global
  % Akkorde folgen hier.
  c4. g8 c2 | f4 g c2 | a2:m c4 g | c2 g2 |
  c4. g8 c2 | f4 g c2 | d2:m g4 g:7 | c1 |
  g1 | c1 | g1 | c2 g | f1 | g4 e a2:m |
  f2 d2:m | g4 c8 g2 
}

refrainVoice = \transpose c d \relative c' {
  \global
  \dynamicUp
  % Die Noten folgen hier.
  e8 e e d c4 e8( g ) | a4. g8 g4 e | c4 c c d | e g d2 |
  e8 e e d c4 e8 g | a4. g8 g4 e | d8 d e f e4 d | c2.
}

stanzaVoice = \transpose c d  \relative c' {
  r8 c d8 d8( d)  c8 d c e d | d c2~ c4 c8 | d8 d d d~ d4 c8 d |
  e4 g d4. c8 | a' a a a8( a ) a8 g f | g4 e8 d c4. c8 | 
  f8 f f f f e d c d8 ( d ) e8 d8~ d2~ | d1-"Refrain..."
}

verseRefrain = \lyricmode {
  \set stanza = "Refrain"
  % Liedtext folgt hier.
  Al -- les was ihr tut, ge -- scheh  in Lie -- be,
  denn Gott selbst die Lie -- be ist.
  Den -- ket stets da -- ran, kei -- ne größ' -- re Lie -- be 
  gibt es als bei Je -- sus Christ.
}

verseOne = \lyricmode {
  \set stanza = "1."
  % Liedtext folgt hier.
  Die Lie -- be ist sanft -- mü -- tig und gü -- tig.
  Sie bläht sich nicht auf, sie be -- nei -- det nicht.
  Sie sucht nicht das ih -- re, son -- dern was an -- dern dient.
  Sie ist es, die die al -- ler -- größ -- te Schuld ver -- gibt.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  % Liedtext folgt hier.
  Je -- sus hat uns stets ge -- lehrt zu lie -- ben.
  „Da -- ran ihr Chris -- ten zu er -- ken -- nen seid.“
  Denn wah -- re Lie -- be, _ das braucht un -- se -- re Zeit.
  - Sie wird nie ver -- ge -- hen und bleibt 
  \set ignoreMelismata = ##t
  in E -- wig -- keit.
  \unset ignoreMelismata

}

verseThree = \lyricmode {
  \set stanza = "3."
  % Liedtext folgt hier.
  Doch wer \set ignoreMelismata = ##t nun wah -- re \unset ignoreMelismata
  Lie -- be will er -- le -- ben,
  der kommt an Je -- sus 
  - - nicht vor -- bei.
  \set ignoreMelismata = ##t
  Denn groß ja ist die Sün -- de, die uns trennt von _ Gott.
  \unset ignoreMelismata
  Aus Lie -- be Chris -- tus starb für uns und macht uns frei.
  \unset ignoreMelismata
}

verseFour = \lyricmode {
  \set stanza = "4."
  % Liedtext folgt hier.
  Wir lie -- ben nun weil Gott zu -- erst ge -- liebt.
  Und weil er dem \set ignoreMelismata = ##t der glaubt, al -- le Schuld ver -- gibt.
  Drum lasst da -- von er -- zäh -- len,
  reich -- lich Gu -- tes - tun.
  auf dass die Men -- schen glau -- ben an das E -- van -- ge -- li -- um.
}


chordsPart = \new ChordNames \chordNames

sopranoVoicePart = \new Staff \with {
  instrumentName = ""
  shortInstrumentName = ""
  midiInstrument = "choir aahs"
} 
<< 
{ 
  \new Voice = "refrain" { \refrainVoice } \break 
  \new Voice = "stanza" { \stanzaVoice }
}
\new Lyrics << 
  \lyricsto "refrain" { \verseRefrain } 
  \lyricsto "stanza" { \verseOne }
>>
\new Lyrics << 
  \lyricsto "stanza" { \verseTwo }
>>
\new Lyrics << 
  \lyricsto "stanza" { \verseThree }
>>
\new Lyrics << 
  \lyricsto "stanza" { \verseFour }
>>
>>
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
