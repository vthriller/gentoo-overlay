# Any copyright is dedicated to the Public Domain.
# http://creativecommons.org/publicdomain/zero/1.0/
#
# A GDB Python script to fetch debug symbols from the Mozilla symbol server.
#



import gzip
import io
import itertools
import os
import shutil
import sys
import urllib.request, urllib.parse, urllib.error
import urllib.request, urllib.error, urllib.parse
import urllib.parse

SYMBOL_SERVER_URL = 'https://s3-us-west-2.amazonaws.com/org.mozilla.crash-stats.symbols-public/v1/'

def munge_build_id(build_id):
    '''
    Breakpad stuffs the build id into a GUID struct so the bytes are
    flipped from the standard presentation.
    '''
    b = list(map(''.join, list(zip(*[iter(build_id.upper())]*2))))
    return ''.join(itertools.chain(reversed(b[:4]), reversed(b[4:6]),
                                   reversed(b[6:8]), b[8:16])) + '0'

def try_fetch_symbols(filename, build_id, destination):
    debug_file = os.path.join(destination, filename + '.dbg')
    if os.path.exists(debug_file):
        return debug_file
    path = os.path.join(filename, munge_build_id(build_id), filename + '.dbg.gz')
    url = urllib.parse.urljoin(SYMBOL_SERVER_URL, urllib.parse.quote(path))
    try:
        print('Fetching symbols from {0}'.format(url))
        u = urllib.request.urlopen(url)
        if u.getcode() != 200:
            return None
        with open(debug_file, 'wb') as f, gzip.GzipFile(fileobj=io.BytesIO(u.read()), mode='r') as z:
            shutil.copyfileobj(z, f)
            return debug_file
    except:
        return None

def new_objfile(event):
    build_id = event.new_objfile.build_id if hasattr(event.new_objfile, 'build_id') else None
    print('New objfile: {0} {1}'.format(event.new_objfile.filename, build_id))
    if build_id:
        debug_file = try_fetch_symbols(os.path.basename(event.new_objfile.filename), build_id, '/tmp/gdb-symbols')
        if debug_file:
            event.new_objfile.add_separate_debug_file(debug_file)

gdb.events.new_objfile.connect(new_objfile)
try:
    os.mkdir('/tmp/gdb-symbols')
except OSError:
    pass
