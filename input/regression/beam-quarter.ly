
\version "2.3.16"
\header
{
    texidoc= "Quarter notes may be beamed: the beam is halted momentarily."
}

\score { \relative c'' {
	 c8[ c4 c8] % should warn here!
}
\paper { raggedright = ##t} 
}
