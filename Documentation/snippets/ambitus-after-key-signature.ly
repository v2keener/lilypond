%% DO NOT EDIT this file manually; it is automatically
%% generated from LSR http://lsr.di.unimi.it
%% Make any changes in LSR itself, or in Documentation/snippets/new/ ,
%% and then run scripts/auxiliar/makelsr.py
%%
%% This file is in the public domain.
\version "2.23.9"

\header {
  lsrtags = "pitches, staff-notation, vocal-music"

  texidoc = "
By default, ambitus are positioned at the left of the clef.  The
@code{\\ambitusAfter} function allows for changing this
placement.  Syntax is @code{\\ambitusAfter grob-interface} (see
@uref{http://lilypond.org/doc/v2.22/Documentation/internals/graphical-object-interfaces,Graphical
Object Interfaces} for a list of possible values for
@code{grob-interface}.)

A common use case is printing the ambitus between key signature and
time signature.

"
  doctitle = "Ambitus after key signature"
} % begin verbatim

\new Staff \with {
  \consists Ambitus_engraver
} \relative {
  \ambitusAfter key-signature
  \key d \major
  es'8 g bes cis d2
}
