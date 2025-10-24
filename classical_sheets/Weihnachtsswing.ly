\version "2.18.2"

%category: classical
%year: 2016

\header {
  title = "Weihnachtsswing"
  composer = "Jan Martin Reckel"
  % Voreingestellte LilyPond-Tagline entfernen
  tagline = ##f
}

\paper {
  #(set-paper-size "a4")
}

\layout {
  \context {
    \Voice
    \consists "Melody_engraver"
    \override Stem #'neutral-direction = #'()
  }
}

global = {
  \key c \major
  \time 2/2
}

trumpetC = \relative c'' {
  \global
  % Die Noten folgen hier.
  \partial 4 g | c2 a | g2. f4 | e2 d2 | c2. \breathe g'4 | a8 g f g a4 f | g2 e | f4 e8 d e4 d |
  d2. \breathe g4 | c2 a | g2. e4 | e( f) d2 | c2. \breathe g'4 | a8 g a g a4 b | c8 b c b c4 g |
  f8 g f4 d4 g4 | e4 f g2 \breathe | a8 g a g a4 b | c g e g | f8 e d e d4. c8 | c2. \breathe g'4 \f |
  c2 g | e c4 g' | a8 g a g a4 f | g2. \breathe g4 | g2 a | b b | c8 b c b a4 a | g2. \breathe g4 | e'2 d | c g | 
  a8 g a g a4 a | g2. \breathe e4 | e2 fis | g b4 g | a e g fis | g2. g4 | c2 g | e c |
  a'8 g a g a4 f | g2. \breathe e4 | a4. g8 a4 f | g e c e | d8 e d e d4 e | c2. \breathe
  e4 | e2 e | a2 a | c c4 c8 b | a4 a a \breathe g | a a8 b c4 a | g4 e c e | e d8 e d4 c | g'2. \breathe
  g4 | c2 a | g2. e4 | f8 e f e f4 g | e2. \breathe g4 | c2 a | g2. \breathe c4 | e4 c d b | c2. \bar "|."
}

right = \relative c'' {
  \global
  % Die Noten folgen hier.
  
}

left = \relative c' {
  \global
  % Die Noten folgen hier.
  
}

cello = \relative c {
  \global
  % Die Noten folgen hier.
  \partial 4 r4 | c1~ | c | c2 g | c1 | f1 | e | d | b | c | c | a2 f4\staccato g\staccato | c1 |
  f1 | e | d | c | f1 | e | d2 g | c1 | c | c, | f | e | e2 d | g1 | a2 fis4 d | g1 |
  c4\staccato g\staccato b\staccato g\staccato | a2 e | f1 | e | c | b2 g | c d | g,1 |
  c1 | c1 | f | e | f | e2 a | f4( d ) g2 | c,1 | gis1 | a | a2 e' | a2 g | f1 | 
  e2 c | c2 d | g,1 | c | c | f2 g | c1 | c, | c | c2 d4 g | << c,2. e2. >>
}

trumpetCPart = \new Staff \with {
  instrumentName = "Trompete oder Flöte"
  midiInstrument = "trumpet"
} \trumpetC

pianoPart = \new PianoStaff \with {
  instrumentName = "Klavier"
} <<
  \new Staff = "right" \with {
    midiInstrument = "acoustic grand"
  } \right
  \new Staff = "left" \with {
    midiInstrument = "acoustic grand"
  } { \clef bass \left }
>>

celloPart = \new Staff \with {
  instrumentName = "Cello"
  midiInstrument = "cello"
} { \clef bass \cello }

\score {
  <<
    \trumpetCPart
    %\pianoPart
    \celloPart
  >>
  \layout { }
  \midi {
    \tempo 4=200
  }
}
