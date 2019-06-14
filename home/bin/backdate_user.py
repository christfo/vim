#!/usr/bin/env python

import json
import sys
import tornado.web

sv_cookie = sys.argv[1]
try:
   secret_path = sys.argv[2]
except Exception:
   secret_path = '/etc/menlo/conf/cookie_secret'

with open(secret_path) as f:
   secret = f.readline().strip()

juser = tornado.web.decode_signed_value(secret, 'safeview-id', sv_cookie)
user = json.loads(juser)
user['t'] = user['t'] - 86400 - 100
juser = json.dumps(user)
sv_cookie = tornado.web.create_signed_value(secret, 'safeview-id', juser)
print sv_cookie


