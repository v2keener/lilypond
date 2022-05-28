%% DO NOT EDIT this file manually; it is automatically
%% generated from LSR http://lsr.di.unimi.it
%% Make any changes in LSR itself, or in Documentation/snippets/new/ ,
%% and then run scripts/auxiliar/makelsr.py
%%
%% This file is in the public domain.
\version "2.23.9"

\header {
  lsrtags = "rhythms"

  texidoc = "
Kneed beams are inserted automatically when a large gap is detected
between the note heads.  This behavior can be tuned through the
@code{auto-knee-gap} property.  A kneed beam is drawn if the gap is
larger than the value of @code{auto-knee-gap} plus the width of the
beam object (which depends on the duration of the notes and the slope
of the beam). By default @code{auto-knee-gap} is set to 5.5 staff
spaces.

"
  doctitle = "Changing beam knee gap"
} % begin verbatim

{
  f8 f''8 f8 f''8
  \override Beam.auto-knee-gap = #6
  f8 f''8 f8 f''8
}
