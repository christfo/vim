#!/usr/bin/env python
#
# Copyright (C) 2014 Safely, Inc.
#

"""Pre-commit hook that enforces various style guidelines.

You need to symlink it under .git/hooks/pre-commit for it to be run
automatically.
"""

import argparse
import logging
import os
import re
import subprocess
import sys

log = logging.getLogger('root')

GIT_ROOT = subprocess.check_output(['git', 'rev-parse',
                                    '--show-toplevel']).rstrip('\n')
PYLINT_RC = os.path.join(GIT_ROOT, 'service/misc/pylint.rc')
PYTHON_LIB_PATH = os.path.join(GIT_ROOT, 'service/lib')
PYTHON_TESTLIB_PATH = os.path.join(GIT_ROOT, 'service/test/')

def get_modified_files():
   output = subprocess.check_output(['git', 'diff-index', '--name-only',
                                     '--cached', '--diff-filter=AM', 'HEAD'])
   return [os.path.join(GIT_ROOT, filename) for filename in
           output.rstrip('\n').split('\n')]

def validate_python_file(filepath, env):
   success = True
   try:
      subprocess.check_output(['/usr/local/bin/pylint', '--rcfile',
                               PYLINT_RC, '-r', 'n', filepath],
                              env=env, cwd=os.path.dirname(filepath))
   except subprocess.CalledProcessError as exc:
      success = False
      ptrn = re.compile(r'([A-Z]): *(\d+), *(\d+): (.+)', re.MULTILINE)
      op = ptrn.sub(r'  File "%s", line \2, module \1 \n    \4' % (filepath), exc.output)
      log.error('pylint failed for %s (returned %s):\n%s',
                filepath, exc.returncode, op)
   except OSError as exc:
      success = False
      log.error('pylint failed for %s: %s', filepath, exc)
   return success

def validate_js_file(filepath, env):
   success = True
   try:
      subprocess.check_output(['/usr/local/bin/jslint', filepath],
                              env=env, cwd=os.path.dirname(filepath))
   except subprocess.CalledProcessError as exc:
      success = False
      log.error('jslint failed for %s (returned %s):\n%s',
                filepath, exc.returncode, exc.output)
   except OSError as exc:
      success = False
      log.error('jslint failed for %s: %s', filepath, exc)
   return success

def extant_file(filename):
   """'Type' for argparse - checks that file exists, return abs path."""
   if not os.path.exists(filename):
      raise argparse.ArgumentTypeError('%s does not exist.' % filename)
   return os.path.abspath(filename)

def parse_args():
   parser = argparse.ArgumentParser(description=__doc__.strip())
   parser.add_argument('target_files', nargs='*', type=extant_file,
                       help='Files to verify')
   parser.add_argument("-d", "--debug", action="store_true",
                       default=False, help="Enable debug output")
   return parser.parse_args()

def main(args):
   logging.basicConfig(level=logging.DEBUG if args.debug else logging.INFO,
                       format='[%(asctime)s] %(levelname)s: %(message)s',
                       stream=sys.stderr)
   has_errors = False
   targets = args.target_files if args.target_files else get_modified_files()
   env = {'PYTHONPATH': ':'.join([PYTHON_LIB_PATH, PYTHON_TESTLIB_PATH])}
   log.debug('Using env: %s', env)
   for filepath in targets:
      log.debug('Checking %s.', filepath)
      if filepath.endswith('.py') and not validate_python_file(filepath, env):
         has_errors = True
      if filepath.endswith('.js') and not validate_js_file(filepath, env):
         has_errors = True
   if has_errors:
      sys.exit(1)

if __name__ == '__main__':
   main(parse_args())
