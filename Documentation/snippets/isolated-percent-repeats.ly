%% Do not edit this file; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.13.16"

\header {
  lsrtags = "repeats"

%% Translation of GIT committish: 00ef2ac3dd16e21c9ffdffaa4d6d043a3f1a76e6
  texidoces = "
También se pueden imprimir símbolos de porcentaje sueltos.  Esto se
hace introduciendo un silencio multicompás con una función de
impresión distinta:

"
  doctitlees = "Símbolos de porcentaje sueltos"


%% Translation of GIT committish: d96023d8792c8af202c7cb8508010c0d3648899d
  texidocde = "
Isolierte Prozentwiederholungen können auch ausgegeben werden.  Das wird
erreicht, indem man eine Ganztaktpause notiert und ihre Ausgabeform
ändert:

"
  doctitlede = "Isolierte Prozentwiederholungen"

%% Translation of GIT committish: e98b2d804c2a136edfa28adc894bb584f676c884
  texidocfr = "
Des symboles de pourcentage isolés peuvent aussi être obtenus, au
moyen d'un silence multi-mesures dont on modifie l'aspect :

"
  doctitlefr = "Répétition en pourcent isolée"


  texidoc = "
Isolated percents can also be printed.  This is done by entering a
multi-measure rest with a different print function:

"
  doctitle = "Isolated percent repeats"
} % begin verbatim

\relative c'' {
  \override MultiMeasureRest #'stencil
    = #ly:multi-measure-rest::percent
  \override MultiMeasureRest #'thickness = #0.48
  R1
}

