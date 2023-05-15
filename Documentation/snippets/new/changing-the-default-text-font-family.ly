\version "2.25.5"

\header {
  lsrtags = "text, tweaks-and-overrides"

  texidoc = "
The default font families for text can be overridden."

  doctitle = "Changing the default text font family"
}


%{
You may have to install additional fonts.

Red Hat Fedora

  dejavu-fonts-all

Debian GNU/Linux, Ubuntu

  fonts-dejavu-core
  fonts-dejavu-extra
%}

\paper {
  %{
     run
         lilypond -dshow-available-fonts
     to show all fonts available in the process log.
  %}
  fonts.serif = "DejaVu Serif"
  fonts.sans = "DejaVu Sans"
  fonts.typewriter = "DejaVu Sans Mono"
}

{
  g'''4^\markup {
    DejaVu Serif: \bold bold
                  \italic italic
                  \italic \bold { bold italic }
  }
  g4_\markup {
    \override #'(font-family . sans) {
      DejaVu Sans: \bold bold
                   \italic italic
                   \italic \bold { bold italic }
    }
  }
  g''2^\markup {
    \override #'(font-family . typewriter) {
      DejaVu Sans Mono: \bold bold
                        \italic italic
                        \italic \bold { bold italic }
    }
  }
}
