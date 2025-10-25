\version "2.24.1"

%category: song
%year: 2023
%melody-composer: Jan Martin Reckel
%lyric-poet: Jan Martin Reckel

\header {
  title = "Was man mit Geld nicht kaufen kann"
  composer = "Text und Melodie: Jan Martin Reckel"
  % Voreingestellte LilyPond-Tagline entfernen
  tagline = ##f
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

\layout {
  \context {
    \Voice
    \consists "Melody_engraver"
  }
}

global = {
  \key c \major
  \numericTimeSignature
  \time 3/4
  \partial 4.
}

sopranoVoice = \relative c' {
  \global
  \dynamicUp
  % Die Noten folgen hier.
  e8 e d | c4. c8 d e | e4. c8 e g | a4. a8 g f | e4. c8 e g | a4. a8 g f | e4. e8 e d | c4. c8 e c | d2.~ | d4.
  e8 e d | c4. c8 d e | e4. c8 e g | a4. a8 g f | e4. c8 e g | a4. a8 g f | e2.~ | e4. c8 c b | 
  \time 4/4 c4. e8 d4. c8 |  c2~ c8
  
  
  c8 e g | \time 3/4 a4. a8 g f | e4. c8 e g | a4. a8 g f | e4. c8 e g | a4. c8 b g | c4.\fermata \breathe 
  c,8 c b | c4. e8 d c | c2.~ | c4. \bar "|." 
}

verseOne = \lyricmode {
  \set stanza = "1."
  % Liedtext folgt hier.
  Es wird ge -- sagt, auf die -- ser Welt
  man vie -- les kau -- fen kann mit Geld.
  Und schö -- nes hier er -- le -- ben kann.
  So fin -- det Glück man ir -- gend -- wann.
  
  Doch wer dem folgt, der mer -- ket schnell:
  Das Le -- ben wird nicht wirk -- lich hell.
  Denn was man sich nicht kau -- fen kann
  Hat Gott aus Lie -- be schon ge -- tan.
  
  \set stanza = "Refrain"
  Das was man sich nicht kau -- fen kann
  hat Gott in Je -- sus schon ge -- tan.
  Was man nicht ha -- ben kann für Geld
  gab Je -- sus, als er kam zur Welt
}

verseTwo = \lyricmode {
  \set stanza = "2."
  % Liedtext folgt hier.
  Sie sa -- gen, Lie -- be, Glück und Macht
  durch kau -- fen ein -- fach wird er -- bracht.
  Doch kommt nur O -- ber -- fläch -- lich -- keit
  Und die ver -- geht in schnel -- ler Zeit.

  Die Schuld der Sün -- de, die dich trennt,
  von Gott, der dich liebt und dich kennt,
  kein Geld der Welt be -- zah -- len kann.
  Das hat Je -- sus für dich ge -- tan!
}

verseThree = \lyricmode {
  \set stanza = "3."
  % Liedtext folgt hier.
  Je -- sus hat al -- les schon be -- zahlt.
  Am Kreuz litt er für dich die Qual.
  Drum hör, wie Got -- tes Sohn nun spricht:
  Kommt her zu mit, ich bin das Licht.

  Ver -- trau auf ihn zu je -- der -- zeit.
  Und Freu -- de folgt der Bit -- ter -- keit.
  Glaub fest an ihn, was er ge -- tan:
  Er nimmt dich ar -- men Sün -- der an.
}

\score {
  \new Staff \with {
    instrumentName = ""
    midiInstrument = "choir aahs"
  } { \sopranoVoice }
  \addlyrics { \verseOne }
  \addlyrics { \verseTwo }
  \addlyrics { \verseThree }
  \layout { }
  \midi {
    \tempo 4=80
  }
}
