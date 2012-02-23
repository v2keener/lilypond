% DO NOT EDIT this file manually; it is automatically
% generated from Documentation/snippets/new
% Make any changes in Documentation/snippets/new/
% and then run scripts/auxiliar/makelsr.py
%
% This file is in the public domain.
%% Note: this file works from version 2.15.12
\version "2.15.12"

\header {
%% Translation of GIT committish: 5a7301fc350ffc3ab5bd3a2084c91666c9e9a549
  texidoces = "
Los objetos gráficos de columna de nota (los grobs @code{NoteColumn})
pueden ser sobrepasados por los glissandos.

"
  doctitlees = "Glissando por debajo de un objeto gráfico"

%% Translation of GIT committish: fc1ca638e0b5f66858b9b7a073ceefc1eccb3ed2
  texidocde = "@code{NoteColumn}-Grobs können bei Glissandos übersprungen werden."
  doctitlede = "Glissando kann Grobs überspringen"


%% Translation of GIT committish: 3b125956b08d27ef39cd48bfa3a2f1e1bb2ae8b4
  texidocfr = "
Un glissando peut sauter un objet @code{NoteColumn}.

"
  doctitlefr = "Glissando par dessus un objet graphique"

  lsrtags = "expressive marks, staff-notation, tweaks-and-overrides"
  doctitle = "Glissandi can skip grobs"
  texidoc = "@code{NoteColumn} grobs can be skipped over by glissandi."
} % begin verbatim


\relative c' {
  a2 \glissando
  \once \override NoteColumn #'glissando-skip = ##t
  f''4 d,
}
