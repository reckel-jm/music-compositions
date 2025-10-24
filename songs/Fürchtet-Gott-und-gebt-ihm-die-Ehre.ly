\version "2.24.3"

%category: song
%year: 2023

\header {
  title = "Fürchtet Gott und gebt ihm die Ehre"
  composer = "Jan Martin Reckel"
  % Voreingestellte LilyPond-Tagline entfernen
  tagline = ##f
}

\paper {
  indent = 0
}

\layout {
  \context {
    \Score
    \remove "Bar_number_engraver"
  }
}

global = {
  \key f \minor
  \time 4/4
}

sopranoVoice = \relative c' {
  \global
  \dynamicUp
  % Die Noten folgen hier.
  f4 c f c | as' g8 as g4 f | g4 g g8 g as bes | as4 g8( as ) f2 |
  f4 c f c | as' g8( as ) g4 f | g4 g g8 g as bes | as4 g8 as f2 |
  c'4 f, c' f, | es'4 des8 c des4 bes \breathe  | 
  bes4 es, bes'8 bes c des |
  c4 bes8( as ) g2 |
  f4 c f c | as' g8( as ) g4 f | g4 g g8 g as bes | as4 g8( g ) f2 |
  \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  % Liedtext folgt hier.
  Fürch -- tet Gott und gebt ihm die Eh -- re,
  denn die Stun -- de des Ge -- richts \set ignoreMelismata = ##t bricht he -- ran. \unset ignoreMelismata 
  Es schon bald er -- fül -- let wer -- de, 
  was Gott schon in sei -- nem Wort kün -- digt an.
  
  Fürch -- tet Gott und gebt ihm die Eh -- re
  Welt, be -- te den gro -- ßen Schöp -- fer an.
  Der ge -- macht hat \set ignoreMelismata = ##t Him -- mel und Er -- de, \unset ignoreMelismata 
  solch ein Werk hat nur der Herr ge -- tan.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  % Liedtext folgt hier.
  Chris -- tus ru -- fet heu -- te zur Bu -- ße,
  oh, ver -- sto -- cket eu -- re Her -- zen nicht.
  Wer da glaubt an ihn, wird le -- ben.
  Und er kom -- met sich -- er nicht ins Ge -- richt.
  
  Chris -- tus am Kreuz für uns ge -- stor -- ben,
  für dich und mich hat er \set ignoreMelismata = ##t die -- ses ge -- tan. \unset ingoreMelismata
  Komm zu ihm, der Heil hat er -- wor -- ben,
  so dass Gott die Schuld nicht mehr \set ignoreMelismata = ##t sie -- het  \unset ingoreMelismata an.
  
}

verseThree = \lyricmode {
  \set stanza = "3."
  % Liedtext folgt hier.
  Bald schon wird die Er -- de ver -- ge -- hen, 
  mit den Schä -- tzen, die auf die -- ser Welt.
  Dann nur blei -- bet dies be -- ste -- hen,
  dass dem Ur -- teil Got -- tes nicht ver _ -- fällt. 
  
  Samm -- le Schät -- ze nicht auf der Er -- den,
  bald von Mot -- ten sie zer -- fres -- sen sind.
  Su -- che was im Him -- \set ignoreMelismata = ##t mel kann wer -- den,
  wo die Hei -- mat für dich, du Got -- tes -- kind.
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
