#!/usr/bin/env python

# This file is part of LilyPond, the GNU music typesetter.
#
# Copyright (C) 2007--2020 Graham Percival <graham@percival-music.ca>
#
# LilyPond is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# LilyPond is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with LilyPond.  If not, see <http://www.gnu.org/licenses/>.


import sys
import os
import glob
import re
import optparse
import tempfile

lilypond_flags = "-dno-print-pages -dsafe"

lys_from_lsr = os.path.join ('Documentation', 'snippets')
new_lys = os.path.join ('Documentation', 'snippets', 'new')
ly_output = os.path.join (tempfile.gettempdir (), 'lsrtest')

# which convert-ly and lilypond to use
P = os.path.join (os.environ.get ("LILYPOND_BUILD_DIR", ""),
                  "out/bin/convert-ly")
if os.path.isfile (P):
    conv_path = os.path.dirname (P)
elif os.path.isfile ("build/out/bin/convert-ly"):
    conv_path = "build/out/bin/"
else:
    conv_path=''
convert_ly = os.path.join (conv_path, 'convert-ly')
lilypond_bin = os.path.join (conv_path, 'lilypond')



LY_HEADER_LSR = '''%% DO NOT EDIT this file manually; it is automatically
%% generated from LSR http://lsr.di.unimi.it
%% Make any changes in LSR itself, or in Documentation/snippets/new/ ,
%% and then run scripts/auxiliar/makelsr.py
%%
%% This file is in the public domain.
'''

new_lys_marker = "%%%% generated from %s" % new_lys
LY_HEADER_NEW = '''%%%% DO NOT EDIT this file manually; it is automatically
%s
%%%% Make any changes in Documentation/snippets/new/
%%%% and then run scripts/auxiliar/makelsr.py
%%%%
%%%% This file is in the public domain.
''' % new_lys_marker

options_parser = optparse.OptionParser (
    description = "makelsr - update snippets directory from LSR",
    usage = '''%%prog [options] [LSR_SNIPPETS_DIR]
Unless -s option is specified, this script must be run from top of the
source tree. If LSR_SNIPPETS_DIR is not specified, it defaults to
current directory.

Remove snippets in TOP_SOURCE_DIR/%(lys_from_lsr)s and put in snippets
from LSR_SNIPPETS_DIR run through convert-ly or from
TOP_SOURCE_DIR/%(new_lys)s; if a snippet is present in both
directories, the one from TOP_SOURCE_DIR/%(new_lys)s is preferred.
All written snippets are copied in LY_OUTPUT
with appending translations from .texidoc files and are tested with
lilypond with flags %(lilypond_flags)s

''' % vars ())

options_parser.add_option ('-s', '--top-source',
                           dest="top_source_dir",
                           action="store",
                           metavar="TOP_SOURCE_DIR",
                           default=".",
                           help="set LilyPond top source directory")

options_parser.add_option ('-o', '--ly-output',
                           dest="ly_output",
                           action="store",
                           metavar="LY_OUTPUT",
                           default=ly_output,
                           help="set LilyPond output files temporary directory")

options_parser.add_option ('-p', '--path',
                           dest="bin_path",
                           action="store",
                           metavar="LY_PATH",
                           default=conv_path,
                           help="directory where looking for LilyPond binaries")

options_parser.add_option ('-c', '--convert-ly',
                           dest="convert_ly",
                           action="store",
                           metavar="CONVERT-LY",
                           default="LY_PATH/convert-ly",
                           help="convert-ly binary to use")

options_parser.add_option ('-l', '--lilypond-binary',
                           dest="lilypond_bin",
                           action="store",
                           metavar="LILYPOND_BIN",
                           default="LY_PATH/lilypond",
                           help="lilypond binary to use")

(options, args) = options_parser.parse_args ()

if not os.path.isdir (options.top_source_dir):
    sys.stderr.write ("Error: top source: %s: not a directory\n" % options.top_source_dir)
    sys.exit (4)

lys_from_lsr = os.path.normpath (os.path.join (options.top_source_dir, lys_from_lsr))
new_lys = os.path.normpath (os.path.join (options.top_source_dir, new_lys))
sys.path.append (os.path.normpath (os.path.join (options.top_source_dir, 'python')))
import langdefs
texidoc_dirs = [
    os.path.normpath (os.path.join (options.top_source_dir, 'Documentation', language_code, 'texidocs'))
    for language_code in langdefs.LANGDICT]

if not os.path.isdir (lys_from_lsr):
    sys.stderr.write ("Error: snippets path: %s: not a directory\n" % lys_from_lsr)
    sys.exit (3)
if not os.path.isdir (new_lys):
    sys.stderr.write ("Error: new snippets path: %s: not a directory\n" % lys_from_lsr)
    sys.exit (3)

def find_or_create_temp_dir (requested_dir):
    if os.path.isdir (requested_dir):
        return requested_dir
    if os.path.exists (requested_dir): # maybe a typo; play it safe
        sys.stderr.write ("Error: %s: not a directory\n" % requested_dir)
        sys.exit (3)
    try:
        os.makedirs (requested_dir)
        return requested_dir
    except Exception as e:
        sys.stderr.write ("Warning: could not create directory: %s\n" % e)
    dir = tempfile.gettempdir ()
    sys.stderr.write ("Warning: could not use or create directory %s, using default %s\n" % (requested_dir, dir))
    return dir

ly_output = find_or_create_temp_dir (options.ly_output)

def exit_with_usage (n=0):
    options_parser.print_help (sys.stderr)
    sys.exit (n)

if len (args):
    in_dir = args[0]
    if not (os.path.isdir (in_dir)):
        sys.stderr.write ("Error: %s: not a directory\n" % in_dir)
        sys.exit (4)
    if len (args) > 1:
        exit_with_usage (2)
    tags = os.listdir (in_dir)
else:
    in_dir = ''
    tags = [os.path.splitext (os.path.basename (f))[0]
            for f in glob.glob (os.path.join (lys_from_lsr, '*.snippet-list'))]
## Make sure all users get the same ordering of tags
tags.sort ()

if options.convert_ly == "LY_PATH/convert-ly":
    convert_ly = os.path.join (options.bin_path, "convert-ly")
else:
    convert_ly = options.convert_ly
if not os.path.exists (convert_ly):
    sys.stderr.write ("Warning: %s: no such file\n" % convert_ly)
    convert_ly = "convert-ly"
if options.lilypond_bin == "LY_PATH/lilypond":
    lilypond_bin = os.path.join (options.bin_path, "lilypond")
else:
    lilypond_bin = options.lilypond_bin
if not os.path.exists (lilypond_bin):
    sys.stderr.write ("Warning: %s: no such file\n" % lilypond_bin)
    lilypond_bin = "lilypond"
sys.stderr.write ("Using %s, %s\n" % (convert_ly, lilypond_bin))

unsafe = []
unconverted = []
notags_files = []

# mark the section that will be printed verbatim by lilypond-book
end_header_re = re.compile ('(\\header {.+?doctitle = ".+?})\n', re.M | re.S)

doctitle_re = re.compile (r'(doctitle[a-zA-Z_]{0,6}\s*=\s*")((?:\\"|[^"\n])*)"')
texinfo_q_re = re.compile (r'@q{(.*?)}')
texinfo_qq_re = re.compile (r'@qq{(.*?)}')
def doctitle_sub (title_match):
    # Comma forbidden in Texinfo node name
    title = title_match.group (2).replace (',', '')
    title = texinfo_q_re.sub (r"`\1'", title)
    title = texinfo_qq_re.sub (r'\"\1\"', title)
    return title_match.group (1) + title + '"'

def mark_verbatim_section (ly_code):
    return end_header_re.sub ('\\1 % begin verbatim\n\n', ly_code, 1)

# '% LSR' comments are to be stripped
lsr_comment_re = re.compile (r'\s*%+\s*LSR.*')
begin_header_re = re.compile (r'\\header\s*{', re.M)
ly_new_version_re = re.compile (r'\\version\s*"(.+?)"')
strip_white_spaces_re = re.compile (r'[ \t]+(?=\n)')
final_empty_lines_re = re.compile (r'\n{2,}$')

# add tags to ly files from LSR
def add_tags (ly_code, tags):
    return begin_header_re.sub ('\\g<0>\n  lsrtags = "' + tags + '"\n',
                                ly_code, 1)

# for snippets from Documentation/snippets/new, add message for earliest working version
def add_version (ly_code):
    return '''%% Note: this file works from version ''' + \
        ly_new_version_re.search (ly_code).group (1) + '\n'

def escape_backslashes_in_header(snippet):
    # ASSUME: the \header exists.
    header_char_number_start = snippet.find('\header {')
    header_char_number_end = snippet.find('} % begin verbatim')

    header = snippet[header_char_number_start:header_char_number_end]
    # only one level of escaping happening here
    # thanks to raw strings
    new_header = re.sub(r"@code\{\\([a-zA-Z])", r"@code{\\\\\1", header)
    escaped_snippet = (snippet[:header_char_number_start] +
        new_header + snippet[header_char_number_end:])
    return escaped_snippet

def copy_ly (srcdir, name, tags):
    global unsafe
    global unconverted
    dest = os.path.join (lys_from_lsr, name)
    tags = ', '.join (tags)
    file_path = os.path.join (srcdir, name)
    sys.stderr.write ("\nmakelsr.py: reading %s\n" % file_path)
    s = open (file_path).read ()

    s = doctitle_re.sub (doctitle_sub, s)
    if "new" in srcdir:
        s = LY_HEADER_NEW + add_version (s) + s
    else:
        s = LY_HEADER_LSR + add_tags (s, tags)

    s = mark_verbatim_section (s)
    s = lsr_comment_re.sub ('', s)
    s = strip_white_spaces_re.sub ('', s)
    s = final_empty_lines_re.sub ('\n', s)
    s = escape_backslashes_in_header (s)
    s = s.replace ("\r\n", "\n")
    sys.stderr.write ("makelsr.py: writing %s\n" % dest)
    open (dest, 'w').write (s)

    e = os.system (convert_ly+(" -d -e '%s'" % dest))
    if e:
        unconverted.append (dest)
    if os.path.exists (dest + '~'):
        os.remove (dest + '~')
    # no need to check snippets from Documentation/snippets/new
    if not "new" in srcdir:
        e = os.system (
            "%s %s -o %s '%s'" %
            (lilypond_bin, lilypond_flags, ly_output, dest))
        if e:
            unsafe.append (dest)

def read_source_with_dirs (src):
    snippet_list = {}
    tag_list = {}
    for tag in tags:
        srcdir = os.path.join (src, tag)
        tag_list[tag] = set (map (os.path.basename,
                           glob.glob (os.path.join (srcdir, '*.ly'))))
        for f in tag_list[tag]:
            if f in snippet_list:
                snippet_list[f][1].append (tag)
            else:
                snippet_list[f] = (srcdir, [tag])
    return snippet_list


tags_re = re.compile ('lsrtags\\s*=\\s*"(.+?)"')

def read_source (src):
    snippet_list = {}
    tag_list = dict ([(tag, set()) for tag in tags])
    for f in glob.glob (os.path.join (src, '*.ly')):
        basename = os.path.basename (f)
        m = tags_re.search (open (f, 'r').read ())
        if m:
            file_tags = [tag.strip() for tag in m.group (1). split(',')]
            snippet_list[basename] = (src, file_tags)
            for tag in file_tags:
                if tag in tags:
                    tag_list[tag].add (basename)
                else:
                    tag_list[tag] = set ((basename,))
        else:
            notags_files.append (f)
    return snippet_list, tag_list


def dump_file_list (file, file_list):
    new_list = file_list
    f = open (file, 'w')
    f.write ('\n'.join (sorted (new_list)) + '\n')

## clean out existing lys and generated files - but when we're
## not recreating all of them from the tarball don't delete
## snippets that came from LSR.
if in_dir:
    list(map (os.remove, glob.glob (os.path.join (lys_from_lsr, '*.ly')) +
        glob.glob (os.path.join (lys_from_lsr, '*.snippet-list'))))
else:
    list(map (os.remove, glob.glob (os.path.join (lys_from_lsr, '*.snippet-list'))))
    for f in glob.glob (os.path.join (lys_from_lsr, '*.ly')):
        if new_lys_marker in open (f).read ():
            os.remove (f)
snippets = {}
if in_dir:
    # read LSR source where tags are defined by subdirs
    snippets = read_source_with_dirs (in_dir)

# read Documentation/snippets/new where tags are directly defined
snippets_new, not_used_list = read_source (new_lys)
snippets.update (snippets_new)

for (name, (srcdir, file_tags)) in list(snippets.items ()):
    copy_ly (srcdir, name, file_tags)

not_used_snippets, tag_lists = read_source (lys_from_lsr)

for (tag, file_set) in list(tag_lists.items ()):
    dump_file_list (os.path.join (lys_from_lsr, tag + '.snippet-list'),
                    file_set)
if unconverted:
    sys.stderr.write ('These files could not be converted successfully by convert-ly:\n')
    sys.stderr.write ('\n'.join (unconverted) + '\n\n')
if notags_files:
    sys.stderr.write ('No tags could be found in these files:\n')
    sys.stderr.write ('\n'.join (notags_files) + '\n\n')
if unsafe:
    dump_file_list ('lsr-unsafe.txt', unsafe)
    sys.stderr.write ('''

Unsafe files printed in lsr-unsafe.txt: CHECK MANUALLY!
  git add %(lys_from_lsr)s/*.ly
  xargs git diff HEAD < lsr-unsafe.txt

''' % vars ())
