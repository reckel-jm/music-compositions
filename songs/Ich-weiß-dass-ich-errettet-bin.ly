\version "2.24.2"

%category: song
%year: 2024
%melody-composer: Jan Martin Reckel
%lyric-poet: Jan Martin Reckel
%copyright: Public Domain/CC0
%original-language: German

\header {
  title = "Ich weiß, dass ich errettet bin"
  composer = "Text und Melodie: Jan Martin Reckel"
  % Voreingestellte LilyPond-Tagline entfernen
  tagline = ##f
}

\layout {
  \context {
    \Voice
    \consists "Melody_engraver"
  }
}

global = {
  \key f \major
  \numericTimeSignature
  \time 4/4
  \partial 4
}

\paper {
  indent = 0
}

sopranoVoice = \relative c' {
  \global
  \dynamicUp
  % Die Noten folgen hier.
  c4 | f4 e8( f ) g4 g | a4 g f4 g4 | a4 a bes4 a | g2 \breathe r4
  g4 | a4 bes a4 g | f4 d d4 f8( d ) | c4 f a8( g ) f( e ) | f2. \breathe \break f4 |
  bes4 bes bes4 bes4 | bes4 a a4 c | c4 a a4 f | g2. \breathe c,4 |
  f4 a c4 a | g4 g8( f )  d4 f8( d ) | c4 f a8( g ) f ( e ) | f2 \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  % Liedtext folgt hier.
  Ich weiß, dass ich er -- ret -- tet bin
  und nicht aus eig -- ner Kraft.
  Die Gna -- de Chris -- ti ret -- tet mich 
  und hat mich frei ge -- macht.
}

refrain = \lyricmode {
  Er -- löst bin ich durch Je -- su Blut:
  Welch Freu -- de wel -- che Kraft!
  Es ist mir Fried' und Zu -- ver -- sicht
  dass Je -- sus es voll -- bracht.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  % Liedtext folgt hier.
  Mein Glau -- be ist nicht ein Ge -- fühl,
  er sich -- er steht und fest.
  Der Herr wur -- de für mich er -- höht
  er nie -- mals mich ver -- lässt.
}

verseThree = \lyricmode {
  \set stanza = "3."
  % Liedtext folgt hier.
  Ein Mensch selbst nicht be -- zah -- len kann
  für sei -- ne Sün -- den -- schuld.
  Drum komm zu Je -- sus, der sie nahm auf sich 
  in Lieb' und Huld.
}

verseFour = \lyricmode {
  \set stanza = "4."
  % Liedtext folgt hier.
  Die Ret -- tung kommt durch Glaub al -- lein
  auf Chris -- ti Tod am Kreuz
  Da -- mit sich nie -- mand rüh -- men kann
  und je -- de Knie sich beugt.
}

verseFive = \lyricmode {
  \set stanza = "5."
  So wie die Schlan -- ge einst er -- höht
  In al -- ter Mo -- ses -- zeit
  So wird auch heu -- te, wer da glaubt,
  durch Je -- su Tod be -- freit.
}

verseSix = \lyricmode {
  \set stanza = "6."
  Weil ich nun frei, ge -- ret -- tet bin,
  leb ich nicht mehr al -- lein.
  Für Je -- sus leb ich mei -- nen Herrn, 
  er soll mir al -- les sein.
}

verseSeven = \lyricmode {
  \set stanza = "7."
  Ge -- brau -- che mich Herr als dein Knecht
  so wie du es nur willst.
  Du weißt al -- lein was gut für mich.
  Du mei -- nen Hun -- ger stillst.
}

\score {
  \new Staff \with {
    instrumentName = ""
    midiInstrument = "choir aahs"
  } { \sopranoVoice }
  \addlyrics { \verseOne \refrain }
  \addlyrics { \verseTwo }
  \addlyrics { \verseThree }
  \addlyrics { \verseFour }
  \addlyrics { \verseFive }
  \addlyrics { \verseSix }
  \addlyrics { \verseSeven }

  \layout { }
  \midi {
    \tempo 4=100
  }
}
