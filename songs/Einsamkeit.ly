\version "2.24.1"

%category: song
%year: 2023
%melody-composer: Jan Martin Reckel
%lyric-poet: Jan Martin Reckel

\header {
  title = "Einsamkeit"
  subtitle = "O Herr, ich bin so einsam"
  composer = "Text und Melodie: Jan Martin Reckel"
  % Voreingestellte LilyPond-Tagline entfernen
  tagline = ##f
}

\paper {
  indent = 0
}

\layout {
  \context {
    \Voice
    \consists "Melody_engraver"
  }
}

global = {
  \key d \minor
  \time 4/4
  \partial 4
}

chordNames = \chordmode {
  \global
  % Akkorde folgen hier.
  r4 | d1:m | d1:m | g:m | a | d:m | d:m | e:m | a | g4:m f2 c4 | d1:m |
  g4:m f2 c4 | d1:m | g4:m d:m f4 c | f1 | g4:m d:m a2 | d2.:m
}

sopranoVoice = \relative c' {
  \global
  \dynamicUp
  % Die Noten folgen hier.
  a4 | d e f e | d2 a4 \breathe  d4 |  g  f e d e2. \breathe a,4 | 
  d e f e d2 a4 d | e f g f | e2. a4 | g f f e | d e f a |
  g f f e | d e f \breathe a
  g f f e | f2. \breathe a4 | g f e e | d2. \bar "|."
  
}

verseOne = \lyricmode {
  \set stanza = "1."
  % Liedtext folgt hier.
  O Herr, ich bin so ein -- sam
  und nie -- mand mich ver -- steht.
  Scheint doch mein Le -- ben glück -- lich,
  wer weiß, wie's wirk -- lich geht?
  Auch wenn du so oft an mich denkst
  und mei -- ne Schri -- tte täg -- lich lenkst,
  der Er -- den -- hei -- mat fern,
  hab ich nur mei -- nen Herrn.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  % Liedtext folgt hier.
  O Herr ich bin so ein -- sam,
  kenn mei -- nen Weg doch nicht.
  Ich möch -- te dir gern die -- nen
  doch scheint's als geht es nicht.
  Viel O -- ber fläch -- lich -- keit 
  gibt es in die -- ser schwe -- ren Zeit, doch ich
  nur su -- che dei -- ne Näh,
  wenn ich dich end -- lich säh'.
}

verseThree = \lyricmode {
  \set stanza = "3."
  % Liedtext folgt hier.
  O Herr ich bin so ein -- sam.
  Ich hab dir doch ge -- dient!
  Ein Sün -- der bin ich, a -- ber
  ich hab dich stets ge -- liebt.
  Hilf mir doch klar zu sehn:
  Kein Werk kann doch vor dir be -- stehn.
  Je -- sus ich glaub' an dich,
  und weiß: Du starbst für mich.
  Gott preis!
}

verseFour = \lyricmode {
  \set stanza = "4."
  % Liedtext folgt hier.
  O Herr, ich bin nicht ein -- sam,
  wenn auch in die -- ser Zeit
  mein Le -- ben nicht so fröh -- lich
  und hoff -- nungs -- voll er -- scheint.
  Doch je -- den Tag aufs neu
  weiß ich: Der Herr bleibt mir doch treu.
  Wenn's auch um mich so ein -- sam steht:
  Der Herr selbst mit mir geht.
}

chordsPart = \new ChordNames \chordNames

sopranoVoicePart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "choir aahs"
} { \sopranoVoice }
\addlyrics { \verseOne }
\addlyrics { \verseTwo }
\addlyrics { \verseThree }
\addlyrics { \verseFour }

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
