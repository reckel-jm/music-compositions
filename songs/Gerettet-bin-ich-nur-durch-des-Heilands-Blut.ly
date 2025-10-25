\version "2.24.3"

%category: song
%year: 2025
%melody-composer: S. J. Henderson
%lyric-poet: S. J. Henderson; Jan Martin Reckel
%original-language: English
%translated-language: German
%translator: Jan Martin Reckel
%copyright: Public Domain/CC0

\header {
  title = "Gerettet bin ich nur durch des Heilands Blut"
  subtitle = "Saved by the Blood of the Crucified One"
  composer = "Deutsche Übersetzung und 5. Strophe: J.M. Reckel"
  poet = "Text und Musik: S. J. Henderson"
  copyright = "Public Domain/Als gemeinfreies Werk veröffentlicht"
  tagline = ##f
}

\paper {
  indent = 0
  system-system-spacing = 
    #'((basic-distance . 12 )
       (minimum-distance . 6 )
       (padding . 3 )
       (stretchability . 12 ))
  markup-system-spacing = 
    #'((basic-distance . 12 )
       (minimum-distance . 6 )
       (padding . 3 )
       (stretchability . 12 ))
}

global = {
  \key d \major
  \time 3/4
  \partial 4
}

chordNames = \chordmode {
  \global
  % Akkorde folgen hier.
  \skip4 | d2. | g | a | d | a | a | a | d | g | e:m | a | b:m |
  a | d | a | d |
  
  d | d | g | g | a | a | d | d | d | d | g | e:7 | a2 a4:7 | d2. | a | d
}

stanzaVoice = \relative c' {
  \global
  \dynamicUp
  % Die Noten folgen hier.
  d4 | a'4. a8 a4 b a fis | a g e | d2 \breathe d4 |
  e4. fis8 g4 | g e g | b a4. g8 | fis2 \breathe d4 |
  d'4. d8  d4 | d cis b | a4. b8 a4 | fis2. \breathe |
  a4. b8 cis4 | d4 a fis | a g e | d2. \bar "||"
}

chorusVoice = \relative c'' {
  d4. d8 d4 | d2. \breathe | d4. d8 d4 | d2 \breathe 
  b4 | cis cis4. cis8 | cis4 b a | a4. b8 a4 | fis2. \breathe
  d'4. d8 d4 | d2. \breathe | d4. d8 d4 | d2 \breathe 
  b4 | a4. b8 cis4 | d4 a fis | a4 g e | d2. \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  % Liedtext folgt hier.
  Ge -- ret -- tet bin ich nur durch des Hei -- lands Blut.
  Wie groß mei -- ne Sün -- de, die er mach -- te gut!
  Ein \set ignoreMelismata = ##t Sün -- der war ich, \unset ignoreMelismata der zur Höl -- le hin -- ging.
  Nun bin ich neu, Preis ihm, der für mich hing.

}

refrain = \lyricmode {
  \set stanza = "Chorus"
  Hal -- le -- lu -- ja, Hal -- le -- lu -- ja!
  Die Schuld ist ver -- ge -- ben, sie ist nicht mehr da!
  Hal -- le -- lu -- ja, Hal -- le -- lu -- ja!
  Ich bin nun er -- löst, preis dem Lamm im -- mer -- dar!

}

verseTwo = \lyricmode {
  \set stanza = "2."
  % Liedtext folgt hier.
  Ge -- ret -- tet bin ich nur durch des Hei -- lands Blut
  Die Eng -- el sich freu -- en, denn es ist sehr gut.
  \set ignoreMelismata = ##t 
  Ich bin nun Kind Go -- ttes, mit Je -- sus ich leb'.
  \unset ignoreMelismata
  Er ist mein Gott, Herr Er -- lö -- ser, Pro -- phet.
}

verseThree = \lyricmode {
  \set stanza = "3."
  % Liedtext folgt hier.
  Ge -- ret -- tet bin ich nur durch des Hei -- lands Blut.
  Weil Je -- sus den Wi -- llen des Va -- ters stets tut.
  So \set ignoreMelismata = ##t  groß war der Preis, als Gott sei -- nen Sohn gab, \unset ignoreMelismata
  und mir Er -- lö -- sung, ew' -- ges Heil er -- warb.
}

verseFour = \lyricmode {
  \set stanza = "4."
  % Liedtext folgt hier.
  Ge -- ret -- tet durch das Werk der Drei -- ei -- nig -- keit.
  Gebt Eh -- re dem Va -- ter, dem Sohn und dem Geist.
  \set ignoreMelismata = ##t 
  Er -- löst bin ich und bleib ich für al -- le Zeit.
  \unset ignoreMelismata
  Wer -- de Gott lo -- ben bis in E -- wig -- keit.
}

verseFive = \lyricmode {
  \set stanza = "5."
  % Liedtext folgt hier.
  Ge -- ret -- tet  und von ew' -- ger Stra -- fe be -- freit:
  Das will Gott für je -- den und es gilt noch heut!
  Drum Sün -- der, nimm die -- ses im Glau -- ben doch an,
  Je -- sus am Kreuz es für dich hat ge -- tan!
}

chordsPart = \new ChordNames \chordNames

melodyVoicePart = \new Staff \with {
  midiInstrument = "choir aahs"
} { \stanzaVoice \break \chorusVoice }
\addlyrics { \verseOne \refrain }
\addlyrics { \verseTwo }
\addlyrics { \verseThree }
\addlyrics { \verseFour }
\addlyrics { \verseFive }

\score {
  <<
    \chordsPart
    \melodyVoicePart
  >>
  \layout { }
  \midi {
    \tempo 4=100
  }
}
