\version "2.24.1"

%category: song
%year: 2025
%melody-composer: Jan Martin Reckel
%lyric-poet: Jan Martin Reckel

\header {
  title = "Wer zu Gott will, der kommt an Jesus nicht vorbei"
  subtitle = "Johannes 14,6; Apostelgeschichte 4,12; 1. Timotheus 2,3-6, uvm."
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
  #(set-paper-size "a4")
  indent = 0
  system-system-spacing = #'((padding . 3) (basic-distance . 8))
  % Schönere Schriften
  myStaffSize = #20
  #(define fonts
  (make-pango-font-tree
   "Cambria"
   "Calibri"
   "Consolas"
   (/ myStaffSize 20)))
}

global = {
  \key d \major
  \time 4/4
  \partial 4
}

chordNames = \chordmode {
  \global
  % Akkorde folgen hier.
  d4 | d1 | e2:m g4 e:m | a1 | d4 g a2 | a2. b8:m a | 
  d1 | e2:m g4 e4:m | g2 a | a2:7 d2 |
  
  a1 | d | a | d4 g a4. d8 | g2 e:m | a4 fis b:m d:7 | g2 e:m | a2.
}

refrainVoice = \relative c' {
  \global
  \dynamicUp
  % Die Noten folgen hier.
  d8 e | fis4 a4. fis8 e d | e e e fis b,4 \breathe
  e8 fis | g g g4. e8 d e | fis4. g8 fis e r4| r2. d8 e |
  fis d a'4. fis8 e d | e e e fis b,4 e8 fis | g g g fis fis e fis e | e2 d2 
  \bar "||"
}

stanzaVoice = \relative c' {
  e8 d e d e d fis e | d2.~ d8 
  d8 | e4 e8 e2~ e8 | fis4 g e4. \breathe d8 | 
  g4 g8 g4 g8 a b | a4 fis8( e)  d4 \breathe d4 |
  b4 d8 g4 fis8 e d | e2. 
  
  \bar "||"
}

verseRefrain = \lyricmode {
  % Liedtext folgt hier.
  \set stanza = "Refrain"
  Wer zu Gott will, der kommt an Je -- sus nicht vor -- bei.
  Wer von Lie -- be spricht, der kann vom Kreuz nicht schwei -- gen.
  
  Denn die Gna -- de Got -- tes macht im Sohn nur wirk -- lich frei
  Und so kann sich wah -- re Lie -- be wirk -- lich zei -- gen.
}

verseOne = \lyricmode {
  \set stanza = "1."
  Suchst du Glück in Din -- gen die -- ser Welt,
  und fragst dich, was wirk -- lich zählt.
  Dann schau auf den, der dich mit Gott ver -- söhnt.
  Und Got -- tes Zorn für dich ge -- stillt.
}

verseTwo = \lyricmode {
    \set stanza = "2."
  Wenn du dich nach wah -- rer Lie -- be sehnst,
  und oft al -- lein drau -- ßen stehst.
  Dann schau auf den, den man voll Boß -- heit schlug.
  Und es für dich al -- lein er -- trug.
  
}

verseThree = \lyricmode {
  \set stanza = "3."
  Wenn du ein gu -- ter Mensch möch -- test sein,
  _ schaffst du das nicht al -- lein.
  Denn kei -- ner gut, die Bi -- bel sagt es klar. 
  Und nur Je -- sus Chris -- tus es war.
}

verseFour = \lyricmode {
    \set stanza = "4."
  Schließ -- lich Got -- tes Wort ganz deut -- lich spricht:
  _ Nach dem \set ignoreMelismata = ##t Tod kommt \unset ignoreMelismata das Ge -- richt.
  Drum glaub' an ihn, der am Kreuz für dich starb.
  Und dir das Heil für im -- mer gab.
}

chordsPart = \new ChordNames \chordNames
  
voicePart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "choir aahs"
} << 
  { 
    \new Voice = "refrain" { \refrainVoice } 
    \new Voice = "stanza" { \stanzaVoice }
  }
  \new Lyrics << \lyricsto "refrain" { \verseRefrain} 
                 \lyricsto "stanza" { \verseOne }  
              >>
  \new Lyrics << \lyricsto "stanza" {  \verseTwo } >>
  \new Lyrics << \lyricsto "stanza" {  \verseThree } >>
  \new Lyrics << \lyricsto "stanza" {  \verseFour } >>
  >>


\score {
  <<
    \chordsPart
    { \voicePart }
  >>

  \layout { }
  \midi {
    \tempo 4=100
  }
}
