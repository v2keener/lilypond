%% DO NOT EDIT this file manually; it was automatically
%% generated from the LilyPond Snippet Repository
%% (http://lsr.di.unimi.it).
%%
%% Make any changes in the LSR itself, or in
%% `Documentation/snippets/new/`, then run
%% `scripts/auxiliar/makelsr.pl`.
%%
%% This file is in the public domain.

\version "2.25.3"

\header {
  lsrtags = "real-music, specific-notation, template"

  texidoc = "
A template to write a score for a diatonic accordion.

@itemize
@item
There is a horizontal staff indicating if the accordion must be pushed
(thick line) or pulled (thin line).
@item
There is a small rhythmic staff with lyrics that describes the bass
buttons to press. The bar lines are made from gridlines.
@item
The tabulator staff for diatonic accordions shows the geographic
position of the buttons and not (as for every other instrument) the
pitch of the notes; the keys on the melody side of the accordion are
placed in three columns and about 12 rows.
@end itemize

In the tabulator staff notation the outermost column is described with
notes between lines, the innermost column is described with notes
between lines and a cross as accidental, and the middle column is
described with notes on a line, whereby the row in the middle is
represented on the middle line in the staff.

Some words to transpose piano notes to the diatonic accordion:

@enumerate 
@item
Every diatonic accordion is built for some keys only (for example, for
the keys of C major and F major), so it is important to transpose a
piano melody to match one of these keys. Transpose the source code, not
only the output because this code is required later on to translate it
once more to the tabulator staff. This can be done with the command
@code{displayLilyMusic}.
@item
You have to alternate the push- and pull-direction of the accordion
regularly. If the player has a too long part to pull the accordion gets
broken. On the other hand, some harmonies are only available in one
direction. Considering this, decide which parts of the melody are the
push-parts and which the pull-parts.
@item
For each pull- or push-part translate the piano notes to the according
tabulature representation.
@end enumerate
"

  doctitle = "Score for diatonic accordion"
} % begin verbatim


verse = \lyricmode { Wie gross bist du! Wie gross bist du! }

harmonies = \new ChordNames \chordmode {
  \germanChords
  \set chordChanges = ##t
  bes8 bes8 bes8
  es2 f
  bes1
}

NoStem = { \hide Stem }
NoNoteHead = \hide NoteHead
ZeroBeam = \override Beam.positions = #'(0 . 0)

staffTabLine = \new Staff \with {
  \remove "Time_signature_engraver"
  \remove "Clef_engraver"
} {
  \override Staff.StaffSymbol.line-positions = #'(0)
  % Shows one horizontal line. The vertical line
  %  (simulating a bar-line) is simulated with a gridline
  \set Staff.midiInstrument = #"choir aahs"
  \key c \major
  \relative c''
  {
    % disable the following line to see the noteheads while writing the song
    \NoNoteHead
    \override NoteHead.no-ledgers = ##t

    % The beam between 8th-notes is used to draw the push-line
    %How to fast write the push-lines:
    %  1. write repeatedly 'c c c c c c c c |' for the whole length of the song
    %  2. uncomment the line \NoNoteHead
    %  3. compile
    %  4. Mark the positions on which push/pull changes.
    %     In the score-picture click on the position
    %        the push- or pull-part starts
    %           (on the noteHead, the cursor will change to a hand-icon).
    %     The cursor in the source code will jump just at this position.
    %   a) If a push-part starts there, replace the 'c' by an 'e['
    %   b) If a pull-part starts there, replace the 'c' by an 's'
    %  5. Switch into 'overwrite-mode' by pressing the 'ins' key.
    %  6. For the pull-parts overwrite the 'c' with 's'
    %  7. For every push-part replace the last 'c' with 'e]'
    %        8. Switch into 'insert-mode' again
    %  9. At last it should look like e.g.
    %        (s s e[ c | c c c c c c c c | c c c c c c e] s s)
    % 10. re-enable the line \NoNoteHead
    \autoBeamOff
    \ZeroBeam
    s8 s s e[ c c c c c c e] | s s s s s
  }
}

% Accordion melody in tabulator score
% 1. Place a copy of the piano melody below
% 2. Separate piano melody into pull- and push-parts
%      according to the staffTabLine you've already made
% 3. For each line: Double the line. Remark the 1st one
%      (Keeps unchanged as reference) and then change the second
%      line using the transformation paper
%    or the macros 'conv2diaton push.bsh' and 'conv2diaton pull.bsh'
% Tips:
% - In jEdit Search & Replace mark the Option 'Keep Dialog'

AccordionTabTwoCBesDur = {
  % pull 1
  %<f' bes'>8 <f' a'>8 <d' bes'>8 |
  <g'' a''>8 <g'' b''>8 <e'' a''>8 |
  % push 2
  %<g' c''>4 <f' d''> <g' ees''> <f' a'> |
  <g'' a''>4 <d'' eisis''> <g'' bisis''> <d'' f''> |
  % pull 3
  % <f' bes'>2 r8 }
  <g'' a''>2 r8 }

AccordionTab= { \dynamicUp
  % 1. Place a copy of the piano melody above
  % 2. Separate piano melody into pull- and push-parts
  %      according to the staffTabLine you've already made
  % 3. For each line: Double the line. Remark the 1st one
  %      (Keeps unchanged as reference) and then
  %      change the second line using the transformation paper
  % Tips:
  % - In jEdit Search & Replace mark the Option 'Keep Dialog'
  % -
  \AccordionTabTwoCBesDur
}


\header { tagline = ##f }

\layout {
  \context {
    \Score
    % The vertical line (simulating a bar-line) in
    % the staffBassRhythm is a gridline
    \consists "Grid_line_span_engraver"
  }
  \context {
    \Staff
    \consists "Grid_point_engraver"
    gridInterval = \musicLength 4*4 % 4/4 - tact. How many beats per bar
    % The following line has to be adjusted O-F-T-E-N.
    \override GridPoint.Y-extent = #'(-2 . -21)
  }
  \context {
    \ChoirStaff
    \remove "System_start_delimiter_engraver"
  }
}

staffVoice = \new Staff = astaffvoice  {
  \time 4/4
  \set Staff.instrumentName = "Voice"
  \set Staff.midiInstrument = "voice oohs"
  \key bes \major
  \partial 8*3
  \clef treble
  {
    \context Voice = "melodyVoi"
    {
      <f' bes'>8 <f' a'>8 <d' bes'>8 |
      <g' c''>4 <f' d''> <g' es''> <f' a'> |
      <f' bes'>2 r8
    }
    \bar "|."
  }
}

staffAccordionMel =
\new Staff  \with { \remove "Clef_engraver" } {
  \accidentalStyle forget %Set the accidentals (Vorzeichen) for each note,
  %do not remember them for the rest of the measure.
  \time 4/4
  \set Staff.instrumentName="Accordion"
  \set Staff.midiInstrument="voice oohs"
  \key c \major
  \clef treble
  { \AccordionTab \bar "|." }
}

AltOn =
#(define-music-function (mag) (number?)
  #{ \override Stem.length = #(* 7.0 mag)
      \override NoteHead.font-size =
#(inexact->exact (* (/ 6.0 (log 2.0)) (log mag))) #})

AltOff = {
  \revert Stem.length
  \revert NoteHead.font-size
}

BassRhythm = {s4 s8 | c2 c2 | c2 s8 }
LyricBassRhythmI=  \lyricmode { c b | c }

staffBassRhythm =
\new Staff = staffbass \with { \remove "Clef_engraver" } {
  % This is not a RhythmicStaff  because it must be possible to append lyrics.

  \override Score.GridLine.extra-offset = #'( 13.0 . 0.0 ) % x.y
  \override Staff.StaffSymbol.line-positions = #'( 0 )
  % Shows one horizontal line. The vertical line
  %  (simulating a bar-line) is simulated by a grid
  % Search for 'grid' in this page to find all related functions
  \time 4/4
  {
    \context Voice = "VoiceBassRhythm"
    \stemDown \AltOn #0.6
    \relative c''
    {
      \BassRhythm
    }
    \AltOff
    \bar "|."
  }
}

\score {
  \new ChoirStaff <<
    \harmonies
    \staffVoice
    \context Lyrics = "lmelodyVoi"
      \with { alignBelowContext = astaffvoice }
      \lyricsto melodyVoi \verse
    \staffAccordionMel
    \staffTabLine
    \staffBassRhythm
    \context Lyrics = "lBassRhythmAboveI"
      \with { alignAboveContext = staffbass }
      \lyricsto VoiceBassRhythm \LyricBassRhythmI
  >>
}
