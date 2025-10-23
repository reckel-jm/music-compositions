\version "2.18.2"

\header {
  title = "Ouvertüre"
  composer = "Jan Martin Reckel"
  % Voreingestellte LilyPond-Tagline entfernen
  tagline = ##f
}

\paper {
  #(set-paper-size "a4")
}

global = {
  \key g \major
  \numericTimeSignature
  \time 3/4
}

trumpetBb = \relative c'' {
  \global
  %\transposition bes
  % Die Noten folgen hier.
  d4 g,8 fis g4 | c8 b a g fis4 | b a8 g a b | a2. \trill
  b4. a16 g b8 cis8 | d4 fis g | fis8 e d e cis8. d16 | d2 \trill \breathe a8 b8 |
  c4 c c | b8 a b c a4 | d4. c16 b a8 g | a2. 
  c8 e d c b a | b d c b a g | a c e, a fis8. g16 | g2. \mark "Fine" \bar "||"
  e4 a8 gis a4 | c gis8 fis e4 | d' f8 g a d, | e2. \trill |
  a8 g f g a d, | e d c d e c | d c b f' e b | a2. \breathe
  e4 a8 gis a4 | c gis8 fis e4 | d' f8 g a d, | e2. \trill |
  f4 f8 g a4 | e4 e8 d c4 | a4 d a | \mark "D.C. al Fine" b2. \bar "|."
}

cello = \relative c {
  \global
  % Die Noten folgen hier.
  g2 b4 | c2 d4 | g2 e4 | d2.
  g2 a4 | fis2 b4 | g4 a a, | d2.  |
  d8 fis e g fis a | d,2 fis4 | b a e | fis2.
  e4 c2 | d4 b2 | c4 cis4 d | g2. \bar "||"
  a,2 c4 | e2 a4 | f4. e8 d4 | e4 e, e' | f2. | e | d2 gis4 | e2. |
  a,2 c4 | e2 a4 | f4. e8 d4 | e4 e, e' | d2. | e4 c a | d2 fis4 | g2. 
}

trumpetBbPart = \new Staff \with {
  instrumentName = "Geige"
  midiInstrument = "trumpet"
} \trumpetBb

celloPart = \new Staff \with {
  instrumentName = "Cello"
  midiInstrument = "cello"
} { \clef bass \cello }

\score {
  <<
    \trumpetBbPart
    \celloPart
  >> 
  \layout { }
  \midi {
    \tempo 4=80
  }
}
