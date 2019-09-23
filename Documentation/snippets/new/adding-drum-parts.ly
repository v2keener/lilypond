\version "2.19.56"

\header {
  lsrtags = "percussion, preparing-parts, really-simple, rhythms, specific-notation"

  texidoc = "
Using the powerful pre-configured tools such as the @code{\\drummode}
function and the @code{DrumStaff} context, inputting drum parts is
quite easy: drums are placed at their own staff positions (with a
special clef symbol) and have note heads according to the drum.
Attaching an extra symbol to the drum or restricting the number of
lines is possible.

"
  doctitle = "Adding drum parts"
}

drh = \drummode {
        cymc4.^"crash" hhc16^"h.h." hh hhc8 hho hhc8 hh16 hh
        hhc4 r4 r2
      }
drl = \drummode {
        bd4 sn8 bd bd4 << bd ss >>
        bd8 tommh tommh bd toml toml bd tomfh16 tomfh
      }
timb = \drummode {
         timh4 ssh timl8 ssh r timh r4
         ssh8 timl r4 cb8 cb
       }

\score {
  <<
    \new DrumStaff \with {
      instrumentName = "timbales"
      drumStyleTable = #timbales-style
      \override StaffSymbol.line-count = #2
      \override BarLine.bar-extent = #'(-1 . 1)
    }
    <<
      \timb
    >>
    \new DrumStaff \with { instrumentName = "drums" }
    <<
      \new DrumVoice { \stemUp \drh }
      \new DrumVoice { \stemDown \drl }
    >>
  >>
  \layout { }
  \midi { \tempo 4 = 120 }
}
