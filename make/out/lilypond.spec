Name: lilypond
Version: 0.1.61
Release: 1
Copyright: GPL
Group: Applications/Publishing
Source0: pcnov095.win.tue.nl:/pub/lilypond/development/lilypond-0.1.61.tar.gz
Summary: A program for typesetting music.
URL: http://www.cs.uu.nl/~hanwen/lilypond
Packager: Han-Wen Nienhuys <hanwen@cs.uu.nl>
Icon: lelie_icon.gif
Buildroot: /tmp/lilypond-install

%description 
LilyPond is the GNU Project music typesetter.  The program
generates visual or auditive output from a music 
definition file: it can typeset formatted sheet music 
to a TeX file and play (mechanical) performances to a 
MIDI file.  Features include multiple staffs, meters, 
clefs, keys, lyrics, versatile input-language, 
cadenzas, beams, slurs, triplets.
It includes a nice font of musical symbols.

%prep
%setup
%build
./configure --disable-checking --disable-debugging --enable-printing --prefix=/usr --enable-optimise --enable-shared
make all
%install
rm -rf $RPM_BUILD_ROOT
strip lily/out/lilypond mi2mu/out/mi2mu
make -C Documentation gifs
make prefix="$RPM_BUILD_ROOT/usr" install
%files
%doc Documentation/out/*.txt
%doc Documentation/tex/*.doc
%doc Documentation/tex/*.bib
%doc mutopia/*.ly
%doc input/*.ly
%doc Documentation/out/lelie_logo.gif
/usr/bin/convert-mudela
/usr/bin/mudela-book
/usr/bin/ly2dvi
/usr/bin/lilypond
/usr/bin/mi2mu
# /usr/lib/libflower.so
/usr/man/man1/mi2mu.1
/usr/man/man1/lilypond.1
/usr/man/man1/mudela-book.1
/usr/man/man1/ly2dvi.1
/usr/man/man1/convert-mudela.1
/usr/lib/texmf/texmf/tex/lilypond/
/usr/lib/texmf/texmf/fonts/source/public/lilypond
/usr/share/lilypond/
%post

ln -s 
texhash		# takes some time...
rm `find /var/lib/texmf -name 'feta*pk' -or -name 'feta*tfm'`

ln -s  /usr/lib/texmf/texmf/tex/lilypond  /usr/lib/texmf/texmf/tex/latex/lilypond # suck me plenty
