%% Do not edit this file; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.13.16"

\header {
  lsrtags = "expressive-marks, ancient-notation"

  texidoc = "
This short vertical line placed above the note is commonly used in
baroque music.  Its meaning can vary, but generally indicates notes
that should be played with more @qq{weight}.  The following example
demonstrates how to achieve such a notation.

"
  doctitle = "Vertical line as a baroque articulation mark"
} % begin verbatim

upline =
#(let ((m (make-articulation "stopped")))
   (set! (ly:music-property m 'tweaks)
         (acons 'font-size 3
                (acons 'stencil (lambda (grob)
                                  (grob-interpret-markup
                                   grob
                                   (make-draw-line-markup '(0 . 1))))
                       (ly:music-property m 'tweaks))))
   m)


\relative c' {
  a'4^\upline a( c d')_\upline
}
