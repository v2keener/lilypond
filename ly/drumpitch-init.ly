%%%% Drum pitch names.
%%%% This file is part of LilyPond, the GNU music typesetter.
%%%%
%%%% Copyright (C) 2001--2020 Rune Zedeler <rune@zedeler.dk>,
%%%%                          Han-Wen Nienhuys <hanwen@xs4all.nl>
%%%%
%%%% LilyPond is free software: you can redistribute it and/or modify
%%%% it under the terms of the GNU General Public License as published by
%%%% the Free Software Foundation, either version 3 of the License, or
%%%% (at your option) any later version.
%%%%
%%%% LilyPond is distributed in the hope that it will be useful,
%%%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%%%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%%%% GNU General Public License for more details.
%%%%
%%%% You should have received a copy of the GNU General Public License
%%%% along with LilyPond.  If not, see <http://www.gnu.org/licenses/>.

\version "2.16.0"

drumPitchNames =
#'((acousticbassdrum . acousticbassdrum)
   (bassdrum . bassdrum)
   (hisidestick . hisidestick)
   (sidestick . sidestick)
   (losidestick . losidestick)
   (acousticsnare . acousticsnare)
   (snare . snare)
   (handclap . handclap)
   (electricsnare . electricsnare)
   (lowfloortom . lowfloortom)
   (closedhihat . closedhihat)
   (hihat . hihat)
   (highfloortom . highfloortom)
   (pedalhihat . pedalhihat)
   (lowtom . lowtom)
   (openhihat . openhihat)
   (halfopenhihat . halfopenhihat)
   (lowmidtom . lowmidtom)
   (himidtom . himidtom)
   (crashcymbala . crashcymbala)
   (crashcymbal . crashcymbal)
   (hightom . hightom)
   (ridecymbala . ridecymbala)
   (ridecymbal . ridecymbal)
   (chinesecymbal . chinesecymbal)
   (ridebell . ridebell)
   (tambourine . tambourine)
   (splashcymbal . splashcymbal)
   (cowbell . cowbell)
   (crashcymbalb . crashcymbalb)
   (vibraslap . vibraslap)
   (ridecymbalb . ridecymbalb)
   (mutehibongo . mutehibongo)
   (hibongo . hibongo)
   (openhibongo . openhibongo)
   (mutelobongo . mutelobongo)
   (lobongo . lobongo)
   (openlobongo . openlobongo)
   (mutehiconga . mutehiconga)
   (muteloconga . muteloconga)
   (openhiconga . openhiconga)
   (hiconga . hiconga)
   (openloconga . openloconga)
   (loconga . loconga)
   (hitimbale . hitimbale)
   (lotimbale . lotimbale)
   (hiagogo . hiagogo)
   (loagogo . loagogo)
   (cabasa . cabasa)
   (maracas . maracas)
   (shortwhistle . shortwhistle)
   (longwhistle . longwhistle)
   (shortguiro . shortguiro)
   (longguiro . longguiro)
   (guiro . guiro)
   (claves . claves)
   (hiwoodblock . hiwoodblock)
   (lowoodblock . lowoodblock)
   (mutecuica . mutecuica)
   (opencuica . opencuica)
   (mutetriangle . mutetriangle)
   (triangle . triangle)
   (opentriangle . opentriangle)
   (oneup . oneup)
   (twoup . twoup)
   (threeup . threeup)
   (fourup . fourup)
   (fiveup . fiveup)
   (onedown . onedown)
   (twodown . twodown)
   (threedown . threedown)
   (fourdown . fourdown)
   (fivedown . fivedown)
   (bda . acousticbassdrum)
   (bd . bassdrum)
   (ssh . hisidestick)
   (ss . sidestick)
   (ssl . losidestick)
   (sna . acousticsnare)
   (sn . snare)
   (hc . handclap)
   (sne . electricsnare)
   (tomfl . lowfloortom)
   (hhc . closedhihat)
   (hh . hihat)
   (tomfh . highfloortom)
   (hhp . pedalhihat)
   (toml . lowtom)
   (hho . openhihat)
   (hhho . halfopenhihat)
   (tomml . lowmidtom)
   (tommh . himidtom)
   (cymca . crashcymbala)
   (cymc . crashcymbal)
   (tomh . hightom)
   (cymra . ridecymbala)
   (cymr . ridecymbal)
   (cymch . chinesecymbal)
   (rb . ridebell)
   (tamb . tambourine)
   (cyms . splashcymbal)
   (cb . cowbell)
   (cymcb . crashcymbalb)
   (vibs . vibraslap)
   (cymrb . ridecymbalb)
   (bohm . mutehibongo)
   (boh . hibongo)
   (boho . openhibongo)
   (bolm . mutelobongo)
   (bol . lobongo)
   (bolo . openlobongo)
   (cghm . mutehiconga)
   (cglm . muteloconga)
   (cgho . openhiconga)
   (cgh . hiconga)
   (cglo . openloconga)
   (cgl . loconga)
   (timh . hitimbale)
   (timl . lotimbale)
   (agh . hiagogo)
   (agl . loagogo)
   (cab . cabasa)
   (mar . maracas)
   (whs . shortwhistle)
   (whl . longwhistle)
   (guis . shortguiro)
   (guil . longguiro)
   (gui . guiro)
   (cl . claves)
   (wbh . hiwoodblock)
   (wbl . lowoodblock)
   (cuim . mutecuica)
   (cuio . opencuica)
   (trim . mutetriangle)
   (tri . triangle)
   (trio . opentriangle)
   (tt . tamtam)
   (ua . oneup)
   (ub . twoup)
   (uc . threeup)
   (ud . fourup)
   (ue . fiveup)
   (da . onedown)
   (db . twodown)
   (dc . threedown)
   (dd . fourdown)
   (de . fivedown)
   )

midiDrumPitches =
#`((acousticbassdrum . ,(ly:make-pitch -3 6 NATURAL))
   (bassdrum . ,(ly:make-pitch -2 0 NATURAL))
   (hisidestick . ,(ly:make-pitch -3 6 DOUBLE-SHARP))
   (sidestick . ,(ly:make-pitch -2 0 SHARP))
   (losidestick . ,(ly:make-pitch -2 1 FLAT))
   (acousticsnare . ,(ly:make-pitch -2 1 NATURAL))
   (snare . ,(ly:make-pitch -2 2 DOUBLE-FLAT))
   (handclap . ,(ly:make-pitch -2 1 SHARP))
   (electricsnare . ,(ly:make-pitch -2 2 NATURAL))
   (lowfloortom . ,(ly:make-pitch -2 3 NATURAL))
   (closedhihat . ,(ly:make-pitch -2 3 SHARP))
   (hihat . ,(ly:make-pitch -2 4 FLAT))
   (highfloortom . ,(ly:make-pitch -2 4 NATURAL))
   (pedalhihat . ,(ly:make-pitch -2 4 SHARP))
   (lowtom . ,(ly:make-pitch -2 5 NATURAL))
   (openhihat . ,(ly:make-pitch -2 5 SHARP))
   (halfopenhihat . ,(ly:make-pitch -2 5 SHARP))
   (lowmidtom . ,(ly:make-pitch -2 6 NATURAL))
   (himidtom . ,(ly:make-pitch -1 0 NATURAL))
   (crashcymbala . ,(ly:make-pitch -1 0 SHARP))
   (crashcymbal . ,(ly:make-pitch -1 1 FLAT))
   (hightom . ,(ly:make-pitch -1 1 NATURAL))
   (ridecymbala . ,(ly:make-pitch -1 1 SHARP))
   (ridecymbal . ,(ly:make-pitch -1 2 FLAT))
   (chinesecymbal . ,(ly:make-pitch -1 2 NATURAL))
   (ridebell . ,(ly:make-pitch -1 3 NATURAL))
   (tambourine . ,(ly:make-pitch -1 3 SHARP))
   (splashcymbal . ,(ly:make-pitch -1 4 NATURAL))
   (cowbell . ,(ly:make-pitch -1 4 SHARP))
   (crashcymbalb . ,(ly:make-pitch -1 5 NATURAL))
   (vibraslap . ,(ly:make-pitch -1 5 SHARP))
   (ridecymbalb . ,(ly:make-pitch -1 6 NATURAL))
   (mutehibongo . ,(ly:make-pitch -1 6 SHARP))
   (hibongo . ,(ly:make-pitch 0 0 NATURAL))
   (openhibongo . ,(ly:make-pitch 0 1 DOUBLE-FLAT))
   (mutelobongo . ,(ly:make-pitch -1 6 DOUBLE-SHARP))
   (lobongo . ,(ly:make-pitch 0 0 SHARP))
   (openlobongo . ,(ly:make-pitch 0 1 FLAT))
   (mutehiconga . ,(ly:make-pitch 0 1 NATURAL))
   (muteloconga . ,(ly:make-pitch 0 2 DOUBLE-FLAT))
   (openhiconga . ,(ly:make-pitch 0 1 SHARP))
   (hiconga . ,(ly:make-pitch 0 2 FLAT))
   (openloconga . ,(ly:make-pitch 0 1 DOUBLE-SHARP))
   (loconga . ,(ly:make-pitch 0 2 NATURAL))
   (hitimbale . ,(ly:make-pitch 0 3 NATURAL))
   (lotimbale . ,(ly:make-pitch 0 3 SHARP))
   (hiagogo . ,(ly:make-pitch 0 4 NATURAL))
   (loagogo . ,(ly:make-pitch 0 4 SHARP))
   (cabasa . ,(ly:make-pitch 0 5 NATURAL))
   (maracas . ,(ly:make-pitch 0 5 SHARP))
   (shortwhistle . ,(ly:make-pitch 0 6 NATURAL))
   (longwhistle . ,(ly:make-pitch 1 0 NATURAL))
   (shortguiro . ,(ly:make-pitch 1 0 SHARP))
   (longguiro . ,(ly:make-pitch 1 1 NATURAL))
   (guiro . ,(ly:make-pitch 1 0 DOUBLE-SHARP))
   (claves . ,(ly:make-pitch 1 1 SHARP))
   (hiwoodblock . ,(ly:make-pitch 1 2 NATURAL))
   (lowoodblock . ,(ly:make-pitch 1 3 NATURAL))
   (mutecuica . ,(ly:make-pitch 1 3 SHARP))
   (opencuica . ,(ly:make-pitch 1 4 NATURAL))
   (mutetriangle . ,(ly:make-pitch 1 4 SHARP))
   (triangle . ,(ly:make-pitch 1 4 DOUBLE-SHARP))
   (opentriangle . ,(ly:make-pitch 1 5 NATURAL))

   ;; "transposing" pitches:
   (oneup . ,(ly:make-pitch 0 1 NATURAL))
   (twoup . ,(ly:make-pitch 0 2 NATURAL))
   (threeup . ,(ly:make-pitch 0 3 NATURAL))
   (fourup . ,(ly:make-pitch 0 4 NATURAL))
   (fiveup . ,(ly:make-pitch 0 5 NATURAL))
   (onedown . ,(ly:make-pitch -1 6 NATURAL))
   (twodown . ,(ly:make-pitch -1 5 NATURAL))
   (threedown . ,(ly:make-pitch -1 4 NATURAL))
   (fourdown . ,(ly:make-pitch -1 3 NATURAL))
   (fivedown . ,(ly:make-pitch -1 2 NATURAL))
 )


#(for-each
  (lambda (k-v)
    (module-define! (current-module)
                    (car k-v)
                    (alist->hash-table (cdr k-v)))
    )
   '((drums-style .
     (
      (acousticbassdrum () #f -3)
      (bassdrum () #f -3)
      (sidestick cross #f 1)
      (acousticsnare () #f 1)
      (snare () #f 1)
      (handclap triangle #f 1)
      (electricsnare () #f 1)
      (lowfloortom () #f -4)
      (closedhihat cross "stopped" 3)
      (hihat cross #f 3)
      (highfloortom () #f -2)
      (pedalhihat cross #f -5)
      (lowtom () #f -1)
      (openhihat cross "open" 3)
      (halfopenhihat xcircle #f 3)
      (lowmidtom () #f 0)
      (himidtom () #f 2)
      (crashcymbala xcircle #f 5)
      (crashcymbal xcircle #f 5)
      (hightom () #f 4)
      (ridecymbala cross #f 5)
      (ridecymbal cross #f 5)
      (chinesecymbal mensural #f 5)
      (ridebell () #f 5)
      (splashcymbal diamond #f 5)
      (cowbell triangle #f 5)
      (crashcymbalb cross #f 5)
      (vibraslap diamond #f 4)
      (ridecymbalb cross #f 5)
      ))


   (agostini-drums-style .
     ((acousticbassdrum () #f -6)
      (bassdrum () #f -5)
      (sidestick cross #f 0)
      (acousticsnare () #f 1)
      (snare () #f 0)
      (handclap triangle #f 0)
      (electricsnare () #f 0)
      (lowfloortom () #f -3)
      (closedhihat cross #f 5)
      (hihat cross #f 5)
      (highfloortom () #f -2)
      (pedalhihat cross #f -7)
      (lowtom () #f -3)
      (openhihat xcircle #f 5)
      (halfopenhihat xcircle #f 5)
      (lowmidtom () #f 2)
      (himidtom () #f 3)
      (crashcymbala cross #f 7)
      (crashcymbal cross #f 8)
      (hightom () #f 3)
      (ridecymbala cross #f 6)
      (ridecymbal cross #f 6)
      (chinesecymbal mensural #f 6)
      (ridebell mi #f 7)
      (splashcymbal diamond #f 6)
      (cowbell triangle #f 6)
      (crashcymbalb cross #f 6)
      (vibraslap diamond #f 4)
      (ridecymbalb cross #f 7)
      ))


   (timbales-style .
     ((losidestick cross #f -1)
      (lotimbale () #f -1)
      (cowbell triangle #f 2)
      (hisidestick cross #f 1)
      (hitimbale () #f 1)
      ))


   (congas-style .
     ((losidestick cross #f -1)
      (loconga () #f -1)
      (openloconga () "open" -1)
      (muteloconga () "stopped" -1)
      (hisidestick cross #f 1)
      (hiconga () #f 1)
      (openhiconga () "open" 1)
      (mutehiconga () "stopped" 1)
      ))


   (bongos-style .
     ((losidestick cross #f -1)
      (lobongo () #f -1)
      (openlobongo () "open" -1)
      (mutelobongo () "stopped" -1)
      (hisidestick cross #f 1)
      (hibongo () #f 1)
      (openhibongo () "open" 1)
      (mutehibongo () "stopped" 1)
      ))


   (percussion-style .
     ((opentriangle cross "open" 0)
      (mutetriangle cross "stopped" 0)
      (triangle cross #f 0)
      (shortguiro () staccato 0)
      (longguiro () tenuto 0)
      (guiro () #f 0)
      (cowbell triangle #f 0)
      (claves () #f 0)
      (tambourine () #f 0)
      (cabasa cross #f 0)
      (maracas () #f 0)
      (handclap () #f 0)
      ))
   ))
