%% DO NOT EDIT this file manually; it is automatically
%% generated from LSR http://lsr.di.unimi.it
%% Make any changes in LSR itself, or in Documentation/snippets/new/ ,
%% and then run scripts/auxiliar/makelsr.py
%%
%% This file is in the public domain.
\version "2.23.1"

\header {
  lsrtags = "rhythms, text"

  texidoc = "
Using the @code{set-bar-number-visibility} context function, bar number
intervals can be changed.

"
  doctitle = "Printing bar numbers with changing regular intervals"
} % begin verbatim

\relative c' {
  \override Score.BarNumber.break-visibility = #end-of-line-invisible
  \context Score \applyContext #(set-bar-number-visibility 4)
  \repeat unfold 10 c'1
  \context Score \applyContext #(set-bar-number-visibility 2)
  \repeat unfold 10 c
}
