#!/usr/bin/python

import json, zlib, base64, argparse

def encode(json_object):
   json_string = json.dumps(json_object)
   compressed = zlib.compress(json_string)
   compressed_json = base64.urlsafe_b64encode(compressed)
   return '0/' + compressed_json.rstrip('=')


if __name__ == '__main__':
   parser = argparse.ArgumentParser(description='Obfuscate a link')
   parser.add_argument("--url")
   parser.add_argument("--tid")
   parser.add_argument("--host")
   parser.add_argument("--version", default='0')
   args = parser.parse_args()
   if args.version == '0':
      data = {'url': args.url, 'tid': args.tid, 'ro': 1}
      print args.host + '/' + encode(data)
   if args.version == '1':
      encodedtid = int(args.tid) ^ 0xdeadbeef
      print args.host + '/1/' + str(encodedtid) +'/' + args.url
