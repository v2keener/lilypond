%% Do not edit this file; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.13.16"

\header {
  lsrtags = "chords, template"

%% Translation of GIT committish: 00ef2ac3dd16e21c9ffdffaa4d6d043a3f1a76e6
  texidoces = "
¿Quiere preparar una hoja guía de acordes (o «lead sheet») con
melodía y acordes?  ¡No busque más!

"

doctitlees = "Plantilla de pentagrama único con música y acordes"


%% Translation of GIT committish: 06d99c3c9ad1c3472277b4eafd7761c4aadb84ae
  texidocja = "
旋律とコードを持つリード譜を欲しくはありませんか？他を見る必要はありません！
"

%% Translation of GIT committish: d96023d8792c8af202c7cb8508010c0d3648899d
  texidocde = "
Wollen Sie ein Liedblatt mit Melodie und Akkorden schreiben?  Hier ist
das richtige Beispiel für Sie!
"

  doctitlede = "Vorlage für eine Notenzeile mit Akkorden"


%% Translation of GIT committish: 9ba35398048fdf1ca8c83679c7c144b1fd48e75b
  texidocfr = "
Vous avez besoin de la partition d'une mélodie avec les accords ?
N'allez pas plus loin !

"

doctitlefr = "Mélodie simple et accords"

  texidoc = "
Want to prepare a lead sheet with a melody and chords? Look no further!


"
  doctitle = "Single staff template with notes and chords"
} % begin verbatim

melody = \relative c' {
  \clef treble
  \key c \major
  \time 4/4

  f4 e8[ c] d4 g
  a2 ~ a
}

harmonies = \chordmode {
  c4:m f:min7 g:maj c:aug
  d2:dim b:sus
}

\score {
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \harmonies
    }
    \new Staff \melody
  >>
  \layout{ }
  \midi { }
}

