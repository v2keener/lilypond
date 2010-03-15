%% Do not edit this file; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.13.16"

\header {
  lsrtags = "chords"

%% Translation of GIT committish: 00ef2ac3dd16e21c9ffdffaa4d6d043a3f1a76e6
  texidoces = "
Para añadir indicaciones de línea divisoria dentro del contexto de
los nombres de acorde @code{ChordNames}, incluya el grabador
@code{Bar_engraver}.

"
  doctitlees = "Añadir barras de compás al contexto de nombres de acorde (ChordNames)"


%% Translation of GIT committish: d96023d8792c8af202c7cb8508010c0d3648899d
  texidocde = "
Um Taktstriche in einem @code{ChordNames}-Kontext anzeigen zu lassen, muss der
@code{Bar_engraver} hinzugefügt werden.

"
  doctitlede = "Tatkstriche in einen ChordNames-Kontext hinzufügen"

  texidoc = "
To add bar line indications in the @code{ChordNames} context, add the
@code{Bar_engraver}.

"
  doctitle = "Adding bar lines to ChordNames context"
} % begin verbatim

\new ChordNames \with {
  \override BarLine #'bar-size = #4
  \consists "Bar_engraver"
}
\chordmode {
  f1:maj7 f:7 bes:7
}


