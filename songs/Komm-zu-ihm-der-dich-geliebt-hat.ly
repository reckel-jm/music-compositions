\version "2.22.2"

%category: song
%year: 2023
%melody-composer: Jan Martin Reckel
%lyric-poet: Jan Martin Reckel
%copyright: Public Domain/CC0
%original-language: German

\header {
  title = "Komm zu ihm, der dich geliebt hat"
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

\paper {
  indent = 0
  system-system-spacing.padding = #3
  markup-system-spacing.padding = #3
}

global = {
  \key d \major
  \time 4/4
  \partial 4
}

chordNames = \chordmode {
  \global
  \germanChords
  % Akkorde folgen hier.
  r4 | d1 | b:m | g | a | d | b:m | g2. e4:m | a2:sus4 a | b1:m | fis:m | g | a2:sus4 a2 | d1 | b2.:m d4:7 | e2:m a |
  d1 | d2 a  |
  d2 g | a d | g d | a4 d a2 |
  d2 g | a d | g e4:m b:m | e4:m b:m a:sus4 a | fis2 b:m | fis b:m | g d | b:m a4 d | g a fis:m d:7 | e2:m a4 a:7 |
  d2. 
}

sopranoVoice = \relative c' {
  \global
  \dynamicUp
  % Die Noten folgen hier.
  d8 e | a2~ a8 a8 a fis | e d2~ d8 b cis | d2~ d8 b8 d fis | e2~ e8 r8 \breathe d e | a2~ a8 a a fis | e8 d2~ d8 d fis |
  g2~ g8 fis e d | a'2~ a8 r8 b cis | d2~ d8 d cis b | cis a2~ a8 fis4 | b2~ b8 b a fis | e2~ e8 \breathe r8 d e |
  a2~ a8 a a fis | e d2~ d8 fis4 | g fis e4. d8 | d1 | r | \bar "||" \break
  
  a'4. d8 b2 | a4 e8 g g4 fis | d d d fis | e d8 e2~ e8 | a4. d8 b2 | a4 e8 g g4 fis | g4 fis e d | e d8 a'2~ a8 | fis4. fis8 b2 | 
  cis4 fis,8 fis d'( cis )  b( a ) | r8 b a g a4 d, | d8( e ) fis a2~ a8 | r8 b a g a4 d, | g fis e8 d4. | d2. \bar "|."
  
}

verseOne = \lyricmode {
  \set stanza = "1."
  % Liedtext folgt hier.
  Die -- se Welt hat vie -- le We -- ge, die zu ge -- hen la -- den ein.
  Doch es gibt auch viel' Pro -- ble -- me, Men -- schen füh -- len sich al -- lein.
  Die -- se Welt, sie hat auch Hoff -- nung, ein Licht, das für uns scheint.
  Die -- ses Licht in Je -- sus Chris -- tus zeigt Got -- tes Herr -- lich -- keit.
}

refrain = \lyricmode {
  \set stanza = "Refrain" Komm zu ihm, der dich ge -- liebt hat!
  Je -- sus gab sein Le -- ben hin.
  Komm zu ihm, der schon ge -- siegt hat!
  Je -- sus gibt dem Le -- ben Sinn.
  Komm zu ihm, der dich ge -- liebt hat,
  er macht dein Le -- ben wie -- der neu,
  ver trau -- e ihm, 
  er bleibt dir im -- mer treu.
  
}

verseTwo = \lyricmode {
  \set stanza = "2."
  % Liedtext folgt hier.
  Vie -- le su -- chen Glück und Reich -- tum,
  Lie -- be und Zu -- frie -- den -- heit.
  Doch sie blei -- ben stets ge -- trie -- ben
  von den Stür -- men die -- ser Zeit.
  Wie ein Schiff, dass oh -- ne Ziel ist
  so trei -- ben sie um -- her.
  Doch wohl dem, der doch ein Ziel hat,
  wo Je -- sus ist der Herr.
}

verseThree = \lyricmode {
  \set stanza = "3."
  % Liedtext folgt hier.
  Komm zu ihm, der dich er -- quick -- et 
  und _ macht dich wirk -- lich frei.
  Denn es gibt kein' and' -- re Hoff -- nung
  nur in Je -- sus ist das Heil.
  Nur ein Weg, der dich zum Ziel führt.
  Ein' Tür, die of -- fen bleibt.
  Wer ihm folgt, der wird nicht wan -- ken
  und lebt in E -- wig -- keit.
}

chordsPart = \new ChordNames \chordNames

sopranoVoicePart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "choir aahs"
} { \sopranoVoice }
\addlyrics { \verseOne \refrain }
\addlyrics { \verseTwo }
\addlyrics { \verseThree }

\score {
  <<
    \chordsPart
    \sopranoVoicePart
  >>
  \layout { }
  \midi {
    \tempo 4=95
  }
}
