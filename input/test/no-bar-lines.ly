
\version "2.3.16"
% possible rename to bar-lines-foo.  -gp

\header{ texidoc = "@cindex Bar Lines Remove
Engravers can be removed one by one. Here, the time signature and bar lines 
have been removed.
"
}

\score {
   \relative c'' {
    a b c d
    d c b a
  }
  \paper {
    raggedright = ##t
    \context {
      \Staff
      whichBar = #""
      \remove "Time_signature_engraver"
    }
  }
}


