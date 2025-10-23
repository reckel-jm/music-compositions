% Dieses Notenblatt wurde erstellt von Michael Nausch
% Kontakt: michael@nausch.org (PGP public-key 0x2384C849) 

\version "2.16.0"
\header {
  title = "Freude, große Freude"             % Die Überschrift der Noten wird zentriert gesetzt. 
  poet = "Text: Jan Martin Reckel" % Name des Dichters, linksbündig unter dem Unteruntertitel. 
  composer = "Melodie: Jan Martin Reckel" % Name des Komponisten, rechtsbüngig unter dem Unteruntertitel. 
  tagline = ""
}


\layout {
  \context {
    \Score
    \omit BarNumber
    % or:
    %\remove "Bar_number_engraver"
  }
  indent = 0
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

global = {
  \key f \major
  \time 4/4
}

% Akkorde für die Gitarrenbegleitung
akkorde = \chordmode { \global
  \germanChords
  \set chordChanges = ##t
  
}


melodie= \relative c'' {
  \global
  c4 a d c | bes2 a \breathe | g4 g d e | f1 |
  c'4 a d c | bes2 a \breathe | g4 g d e | f1 |
  g4 g8(a ) bes4 g | a4 a8( g ) f2 |
  g4 g8( a ) bes4 g | a4 a8( g ) f2 |
  c'4 d bes2 | bes4 c a2 | f4 g a bes | a( g ) f2
}


stanzaOne = \lyricmode {
  \set stanza = "1."
  Freu -- de, gro -- ße Freu -- de
  zieht durch je -- des Land.
  Al -- len fro -- he Nach -- richt
  ma -- chen wir be -- kannt:
  Got -- tes Sohn, Er kam zur Welt,
  gab uns das was uns so fehlt.
  
  Got -- tes Held kam zur Welt,
  bra -- chte gro -- ße Freu -- de!
}

stanzaTwo = \lyricmode {
  \set stanza = "2."
  Frie -- de, tie -- fer Frie -- de
  zieht durch je -- des Land.
  Al -- len tie -- fen Frie -- den
  ma -- chen wir be -- kannt:
  Got -- tes Sohn für uns sich gab,
  \set ignoreMelismata = ##t Frie -  den mit Gott uns so er -- warb. \unset ignoreMelismata 
  
  Got -- tes Held kam zur Welt,
  bra -- chte tie -- fen Frie -- den!
}

stanzaThree = \lyricmode {
  \set stanza = "3."
  Lie -- be, wah -- re Lie -- be,
  zieht durch je -- des Land.
  Al -- len Got -- tes Lie -- be 
  ma -- chen wir be -- kannt.
  
  Er am Kreuz sein Le -- ben ließ,
  bra -- chte uns das Pa -- ra -- dies.
  
  Got -- tes Held kam zur Welt,
  bra -- chte wah -- re Lie -- be!
}

stanzaFour = \lyricmode {
  \set stanza = "4."  
  Hoff -- nung, ech -- te Hoff -- nung
  zieht durch je -- des Land.
  Al -- len ech -- te Hoff -- nung 
  heu -- te wird be -- kannt.
  
  Wer \set ignoreMelismata = ##t an ihn \unset ignoreMelismata glaubt, geht nicht ver -- lor'n,
  dann zum Neu -- en wird ge -- bor'n.
  
  Got -- tes Held kam zur Welt,
  brach -- te ech -- te Hoff -- nung.
}

\score {
  <<
    \new ChordNames { \akkorde }
    \new Voice = "Lied" { \melodie }
    \new Lyrics \lyricsto "Lied" { \stanzaOne }
    \new Lyrics \lyricsto "Lied" { \stanzaTwo }
    \new Lyrics \lyricsto "Lied" { \stanzaThree }
    \new Lyrics \lyricsto "Lied" { \stanzaFour }

  >>
  \midi { }
  \layout { }
}