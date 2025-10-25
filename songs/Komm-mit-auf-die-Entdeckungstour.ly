%year: 2014
%category: song
%melody-composer: Jan Martin Reckel
%lyric-poet: Jan Martin Reckel
%copyright: Public Domain/CC0
%original-language: German

\version "2.24.1"
#(ly:set-option 'crop #t)
\paper {
  #(set-paper-size "a5")
  	top-margin = 1\cm
  	indent = 0
}

\header{
	title = "Komm mit auf Entdeckungstour mit Paulus"
  composer = "Text und Melodie: Jan Martin Reckel"
	tagline = ""
}

global = {
  \time 4/4 
  \key f \major
  \partial 4
}

voiceRefrain = \relative c' { \global
  c4 | f4. f8 f4 g4 | a4 g4 f4 a4 | a2 g2
  r2 c,2 | e4. e8 e4 f4 | g4 f4 e4 g4 | f1 | r2 c2 |
  d4. d8 d4 e4 | f4 f4 e4 d4 | c2 a'4. f8 |
  g4. g8 g4 e4 | g4 f4 e4 d4 | c1 | \bar "||" 
}

voiceStanza = \relative c' { 
  r2. c4 | d4 cis8 d8 f4 e8 d8 | c2 f4. c8 | d4 d8 e8 f8 f8 g8 a8 | g2. s4 \bar "||"                           
}

chordNames = \chordmode {
  s4 | f1 | d1:m | c1 | s1 | c1:7 | g2:m c2 | f1 | f1:7 | bes1 | s1 | f1 | c1 | g1 | c1 |
  s1 | bes1 | f1 | g1 | c1
}

verseRefrain = \lyricmode {
  Komm mit auf die Ent -- dec -- kungs -- tour mit Pau -- lus,
  denn Pau -- lus war ein ganz be -- son -- drer Mann
  drum kön -- nen heu -- te wir viel von ihm ler -- nen
  wie man mit Got -- tes Hil -- fe le -- ben kann!
}

verseOne = \lyricmode {
  \set stanza = #"1."
  An -- fangs ve -- er -- folg -- te er Chris -- ten, doch Je -- sus nahm ihm __ _ de -- n Hass
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Er wur -- de zum ei -- frigs -- ten Jün -- ger, rief Gott ihn __ _ war er stets be -- reit 
}

verseThree = \lyricmode {
   \set stanza = #"3."
  In al -- le -- en schwie -- ri -- gen Zei -- ten ver -- trau -- te er fest __ _ auf den Herrn
}

verseFour = \lyricmode {
  \set stanza = #"4."
 Bis an sein __ _ Le -- be -- ens -- en -- de er -- zähl -- te er an -- de -- ren von -- Gott 
}

verseFive = \lyricmode {
  \set stanza = #"5."
  Nun hat er sein Ziel er __ _- re -- icht, auch dich lädt Je -- sus im Him -- mel ein
}

chordsPart = \new ChordNames \chordNames

voicePart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "choir aahs"
} << 
  { 
    \new Voice = "refrain" { \voiceRefrain } \break  
    \new Voice = "stanza" { \voiceStanza }
  }
  \new Lyrics << \lyricsto "refrain" { \verseRefrain} 
                 \lyricsto "stanza" { \verseOne }  
              >>
  \new Lyrics << \lyricsto "stanza" {  \verseTwo } >>
  \new Lyrics << \lyricsto "stanza" {  \verseThree } >>

  \new Lyrics << \lyricsto "stanza" {  \verseFour } >>
  \new Lyrics << \lyricsto "stanza" {  \verseFive } >>


  >>


\score {
  <<
    \transpose f g { \chordsPart }
    \transpose f g { \voicePart }
  >>

  \layout { }
  \midi {
    \tempo 4=180
  }
}