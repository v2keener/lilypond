\version "2.23.1"

\header {
  texidoc="Accordion register symbols are available in the
@code{(scm accreg)} module as @code{\\markup} and as standalone
music events."
}

#(use-modules (scm accreg))

{
  \discant "131" s1_\markup { \discant "131" }
  \stdBass "Master" s1_\markup { \stdBass "Master" }
  \stdBassIV "Master" s1_\markup { \stdBassIV "Master" }
  \stdBassV "Master" s1_\markup { \stdBassV "Master" }
  \stdBassVI "Master" s1_\markup { \stdBassVI "Master" }
  \freeBass "11" s1_\markup { \freeBass "11" }
}
