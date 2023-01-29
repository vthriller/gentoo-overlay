#!/usr/bin/env python

# Any copyright is dedicated to the Public Domain.
# http://creativecommons.org/publicdomain/zero/1.0/
#
# A GDB Python script to fetch debug symbols from the Mozilla symbol server.
#
# To use, run `source /path/to/symbols.py` in GDB 7.9 or newer, or
# put that in your ~/.gdbinit.

from __future__ import print_function

import gzip
import io
import itertools
import os
import shutil
import sys
try:
    from urllib.request import urlopen
    from urllib.parse import urljoin, quote
except ImportError:
    from urllib2 import urlopen
    from urllib import quote
    from urlparse import urljoin

from elftools.elf.elffile import ELFFile
from elftools.common.exceptions import ELFError

SYMBOL_SERVER_URL = 'https://s3-us-west-2.amazonaws.com/org.mozilla.crash-stats.symbols-public/v1/'

def munge_build_id(build_id):
    '''
    Breakpad stuffs the build id into a GUID struct so the bytes are
    flipped from the standard presentation.
    '''
    b = list(map(''.join, list(zip(*[iter(build_id.upper())]*2))))
    return ''.join(itertools.chain(reversed(b[:4]), reversed(b[4:6]),
                                   reversed(b[6:8]), b[8:16])) + '0'

def try_fetch_symbols(filename, build_id):
    debug_file = os.path.join(build_id[:2], build_id[2:] + '.debug')

    path = os.path.join(filename, munge_build_id(build_id), filename + '.dbg.gz')
    url = urljoin(SYMBOL_SERVER_URL, quote(path))
    print(debug_file, '←', url)


def fetch_symbols_for(file, build_id):
    if build_id:
        debug_file = try_fetch_symbols(os.path.basename(file), build_id)


for dir, dirs, files in os.walk(sys.argv[1]):
    for f in files:
        f = os.path.join(dir, f)

        try:
            elf = ELFFile(open(f, 'rb'))
        except ELFError:
            # not an ELF
            continue

        build_id = None
        for section in elf.iter_sections():
            if section.name != '.note.gnu.build-id':
                continue
            for note in section.iter_notes():
                if note['n_name'] != 'GNU':
                    continue
                if note['n_type'] != 'NT_GNU_BUILD_ID':
                    continue
                build_id = note['n_desc']
                break
            if build_id:
                break

        fetch_symbols_for(f, build_id)
