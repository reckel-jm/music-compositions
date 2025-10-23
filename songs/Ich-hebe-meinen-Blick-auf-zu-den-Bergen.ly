\version "2.24.2"

\header {
  title = "Ich hebe meinen Blick auf zu den Bergen"
  subtitle = "nach Psalm 121"
  composer = "Jan Martin Reckel"
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
  myStaffSize = #20
  #(define fonts
     (make-pango-font-tree "Cambria"
                           "Callibri" 
                           "DejaVu Sans Mono" 
                           (/ myStaffSize 20 )
     )     
   )
  indent = 0
  system-system-spacing = 
    #'((basic-distance . 12 )
       (minimum-distance . 6 )
       (padding . 3 )
       (stretchability . 12 ))
  markup-system-spacing = 
    #'((basic-distance . 12 )
       (minimum-distance . 6 )
       (padding . 3 )
       (stretchability . 12 ))

}

global = {
  \key e \major
  \time 4/4
  \partial 4
}

melodyChords = \chordmode {
  r4 | e1 | b | a1 | e2 e:7 | a b | gis:m cis:m | fis:m b | e e:7 | a b | gis:m cis:m | fis:m b | e2.
}

melody = \relative c' {
  \global
  \dynamicUp
  % Die Noten folgen hier.
  \slurDashed
  b4 | gis'8 fis gis fis gis fis gis b | b4 fis2 e8( dis ) | e4 e cis' cis | b2. a8( b ) |
  cis cis4 cis8 b b4( a8 ) | b2 e,2 | a8( a4 ) gis8 fis( e4 ) fis8 | gis2. a8( b ) | 
  cis cis4 cis8 b b4( a8 ) | b2 e,2 | a8( a4 ) gis8 fis( e4 ) dis8 | e2. 
  \bar "|."
}

verseOne = \lyricmode { 
  \set stanza = "1."
  % Liedtext folgt hier.
    \set ignoreMelismata = ##t
  Ich he -- be mei -- nen Blick auf zu den Ber -- gen:
  Hil -- fe wird mir wo er -- bracht?
  Mei -- ne   
  Hil -- fe sie kommt von dem Herrn, 
  der Him -- mel und Er -- de ge -- macht.
  Mei -- ne Hil -- fe sie kommt von dem Herrn, 
  der Him -- mel und Er -- de ge -- macht.
  \set ignoreMelismata = ##f
}

verseTwo = \lyricmode {
  \set stanza = "2."
  % Liedtext folgt hier.
  Der Herr wird dei -- nen Fuß nicht wan -- ken las -- sen,
  \set ignoreMelismata = ##t
  denn er kennt ja je -- den Schritt. \unset ignoreMelismata
  In gu -- ten und schwe -- ren Zei -- ten
  geht er sel -- ber mit.
  In gu -- ten und schwe -- ren Zei -- ten
  geht er sel -- ber mit.
}

verseThree = \lyricmode {
  \set stanza = "3."
  % Liedtext folgt hier.
  Der Hü -- ter Is -- ra -- els,
  sie -- he er schläft nicht.
  \set ignoreMelismata = ##t Und er bleibt für al -- le Zeit.  \unset ignoreMelismata
  Denn Gott ist der Sel -- be ge -- stern
  heut und \set ignoreMelismata = ##t in E -- wig -- keit. \unset ignoreMelismata
  Denn Gott ist der Sel -- be ge -- stern
  heut und \set ignoreMelismata = ##t in E -- wig -- keit. \unset ignoreMelismata
}

verseFour = \lyricmode {
  \set stanza = "4."
  % Liedtext folgt hier.
  Der Herr be -- hü -- tet dich und ist dein Schat -- ten 
  zu dei -- ner rech -- ten Hand.
  \set ignoreMelismata = ##t 
  Dass am Tag dich die Son -- ne nicht stech -- e
  noch dich der Mond bei Nacht fand.
  Dass am Tag dich die Son -- ne nicht stech -- e
  noch dich der Mond bei Nacht fand.
}

verseFive = \lyricmode {
  \set stanza = "5."
  % Liedtext folgt hier.
  Der Herr be -- hü -- te dich von al -- lem Ü -- bel.
  \set ignoreMelismata = ##t Auf die See -- le gibt er Acht.
  Denn in Je -- sus hat er dich er -- löst,
  \unset ignoreMelismata das Heil es ist voll -- bracht.
  \set ignoreMelismata = ##t Denn in Je -- sus hat er dich er -- löst,
  \unset ignoreMelismata das Heil es ist voll -- bracht.
}

verseSix = \lyricmode {
  \set stanza = "6."
  \set ignoreMelismata = ##t
  Der Herr be -- hü -- te dei -- nen Aus- und Ein -- gang 
  von nun bis in E -- wig -- keit.
  \unset ignoreMelismata Dem Schöp -- fer ge -- bührt \set ignoreMelismata = ##t Preis und Eh -- re 
  \unset ignoreMelismata Kraft und Herr -- lich -- keit.
  \unset ignoreMelismata Dem Schöp -- fer ge -- bührt \set ignoreMelismata = ##t Preis und Eh -- re 
  \unset ignoreMelismata Kraft und Herr -- lich -- keit.
}

\score { 
  <<
  \new ChordNames { 
    \set noChordSymbol = ""
    \set chordChanges = ##t 
    \melodyChords 
  }
  \new Staff \with {
    instrumentName = ""
    midiInstrument = "choir aahs"
  } { \melody }
  \addlyrics { \verseOne }
  \addlyrics { \verseTwo }
  \addlyrics { \verseThree }
  \addlyrics { \verseFour }
  \addlyrics { \verseFive } 
  \addlyrics { \verseSix } 
  >>
  \layout { }
  \midi {
    \tempo 4=100
  }
}
