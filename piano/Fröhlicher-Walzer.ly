\version "2.18.2"

\header {
  title = "Fröhlicher Walzer"
  composer = "Jan Martin Reckel"
  % Voreingestellte LilyPond-Tagline entfernen
  tagline = ##f
}

\paper {
  #(set-paper-size "a4")
}

global = {
  \key d \major
  \numericTimeSignature
  \time 3/4
  \partial 4
  \tempo 4=180
}

right = \relative c'' {
  \global
  % Die Noten folgen hier.
  d8 cis | d a fis a fis a | d,2 e8 fis | e fis g e fis g | fis2 d'8 cis |
  d a fis a fis a | d,2 e8 fis | e fis gis a b gis | a2
}

leftOne = \relative c {
  \global
  % Die Noten folgen hier.
  r4 | r4 <fis a> <fis a> | r <fis a> <fis a> | r4 <e a> <e a> |
  r4 <fis a> <fis a> | r <fis a> <fis a> | r <fis a> <fis a> |
  r4 <gis b> <gis b> | r <e a> <e a>
}

leftTwo = \relative c {
  \global
  % Die Noten folgen hier.
  r4 | d2. | d | cis | d | d | d | d | cis
}

\score {
  \new PianoStaff \with {
    instrumentName = "Klavier"
  } <<
    \new Staff = "right" \with {
      midiInstrument = "acoustic grand"
    } \right
    \new Staff = "left" \with {
      midiInstrument = "acoustic grand"
    } { \clef bass << \leftOne \\ \leftTwo >> }
  >>
  \layout { }
  \midi { }
}
