\version "2.18.2"

\header {
  title = "Abschiedsklänge"
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
  \key es \major
  \time 4/4
}

violin = \relative c'' {
  \global
  % Die Noten folgen hier.
  r1 | bes1 | es2 c | bes2 es | as,2 g | f4 d es2 | g2 f | f8 c' bes d, es g f es |
  c'4 es as,\trill g |
  f8 c g' d es2 |
  g1 | bes1 | c1 | bes1 | g8 es' g es bes' g f es | r1 | f,8 as f f' bes as d bes |
  es, g bes d es d c f, | f' es d c bes as g f | g2 es4 d | c8 f es f as f d f | es2. r4 |
  
  d2. b4 | c2. es,4 | g2. d4 | c2. g'4 | es2. bes'4 | c2. f4 | f2. es4 | d2 bes|
  es4 g es des
  c es as es | c as f as | g bes g r4 | as2 es4 f | bes, es d bes | es es' d c | bes2 as4 bes |
  g1 | bes2 g2 | c as | g f4 d | es1 | c'4 f8 es d16\trill es d es d es d es | es1~ es2 c'4 as |
  g1
}

rightOne = \relative c' {
  \global
  % Die Noten folgen hier.
  es2\p es4 es4 | d2. c4 | bes4 es  c bes~ | << bes2. es >> g4 | << f2 { es4( d ) } >> g4 g |
  f4 as g2 | bes4. bes8 as2 | as4 as g4. es8 | c'4 bes d es | as,2 g |
  
  es2 es4 es4 | d c bes4 bes' | bes4 as f as | g2 f4. es8 | es1 |
  es2 es4 es4 | d c bes as | bes bes' bes as | c2 bes2 | es  c4 bes | as2 as | g2. g4\p(
  
  g4\< d' b g | c es d c | b d g, f' | g c, b d | es c c d8 es | f4 c c d8 es f4\! c c es |
  d c bes as ) | g2 g | c1 | as2 as | g2. r4 | <c as es>2\ff <bes g es>4 <as f d>4 |
  <g es >2 f4( <d' bes as f> ) |  g2 bes,4 as | g2 f4. es8 | es2. g'4 | bes2 bes,4 bes |
  c es es f | g2 f4 g | es4  bes g es | c'2 d,4 f | es1~ | es~ | es1 \bar "|."
}

rightTwo = \relative c' {
  \global
  % Die Noten folgen hier.
  << g1 bes1 >> | as1 | es2 as4 r | g2. r4 | bes2( bes | bes bes) | es2 f | f4 f es4. r8 |
  es4 es << d f >> g | c,4( d ) es2 | << g,1 bes >> | f2 es4 es' | c2 c |
  << { es2 d2 } \\ { r4 bes2  bes4 } >> |
  << g1 bes >> |
  
  g4( bes g bes )| << f2 as >> g2 | g4 es' c2 | as'2 d, |
  << {g2 } \\ { es4 des } >> << es2 c >> | <f c>2 <f d>2 | es1 | r | r | r | r | r | r | r | r |
  << es2 bes >> << es2 bes >> | << es1 c1 >> | << f2 c >> << f2 d2 >> | es2. r4 | \skip 1 | 
  r4 bes4 <d as>2 | <es' bes>2 bes4 as | es2 bes2 | bes1 | g''2 es, | as1 | <es' bes>2 <d bes> |
  <bes g es>4 \skip 2. | as2 bes, |  g4 bes as c | g bes as c | <bes g>1
}

left = \relative c {
  \global
  % Die Noten folgen hier.
  << es,1 es' >> | f,1 | g2 as4 bes | es2. r4 |
  << {  f2 es | d2 es } \\ { bes1 | bes1 }>> |
  g'2 d | bes4 d4 es2 | as,4( g f es | as4 bes es2) |
  << es,1 es' >> | bes2 g | as f | << {bes2 bes~ | bes1 } \\ {r1 | es, } >> |
  es1 | es1 | g2 as~ | as4 f4 bes4 as | g2 as | f2 bes | es,4( bes' es es,)
  
  b'2 g'4. f8 | es2 g2 | g2 f | es d | << c2 g'2 >> bes, | as1 | < f' a,>1 | bes,4 as g f |
  << es'2 es' >> des | <as as,>1 | f,2 bes | es2. r4 | as2 g4 f | <es es,>1 | <es es,>1 | bes |
  <es es,>1 |
  <bes es>1 | <as es'>1 |<es' bes>2 <f bes,>2 | <es bes es,>1 | as4 f bes d |
  << { bes,2 c | bes c | es1 } \\ { es,1~ | es1~ | es1 } >>
}

violinPart = \new Staff \with {
  instrumentName = "Violine"
  midiInstrument = "violin"
} \violin

pianoPart = \new PianoStaff \with {
  instrumentName = "Klavier"
} <<
  \new Staff = "right" \with {
    midiInstrument = "acoustic grand"
  } << \rightOne \\ \rightTwo >>
  \new Staff = "left" \with {
    midiInstrument = "acoustic grand"
  } { \clef bass \left }
>> 

\score {
  <<
    \violinPart
    \pianoPart
  >>
  \layout { }
  \midi {
    \tempo 4=100
  }
}
