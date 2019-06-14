#!/usr/bin/env ruby

require 'pathname'
require 'pry-nav'

bo = <<-HH
time="2018-11-08 00:19:42,049" level=INFO    Running tests in: ~/git/safeview/service/test/nosetests/test_service/test_src/test_auth-server/test_main.py
Backwards compatibility: 2.40 logic to kick in ... WARNING:safely-web:event="load-expired-tenants-fail" error="'expired_tenants'"
ERROR:auth-main:event="auth-bad-request"       service="safeview.auth-server" client_ip="127.0.0.1"   request_host="safe.surfcrew.com" username="foo"  query_username="foo" url="/authorized" present_args="[u'username', u'tid', u't', u'entry_mode']" details="request missing argument" error="'udb_rest'"
WARNING:tornado.access:400 POST /authorized (127.0.0.1) 38.91ms
ERROR:tdagent_output:event="logging-queue-tdagent-exception" error="recursion limit exceeded." error_type="PackValueError"
FAILED
======================================================================
1) FAIL: Backwards compatibility: 2.40 logic to kick in
----------------------------------------------------------------------
   Traceback (most recent call last):
    /usr/local/lib/python2.7/dist-packages/tornado/testing.py line 136 in __call__
      result = self.orig_method(*args, **kwargs)
    test_service/test_src/test_auth-server/test_main.py line 1429 in test_authorized_email_reauth_240
      self.assertEqual(response.code, httplib.FORBIDDEN)
   AssertionError: 400 != 403

-----------------------------------------------------------------------------
1 test run in 0.112 seconds. 
1 FAILED (0 tests passed)
Traceback (most recent call last):
  File "../testlib/tester.py", line 123, in <module>
    run(path_filter=args.filter[0] if args.filter else None)
  File "../testlib/tester.py", line 75, in run
    subprocess.check_call(cmd)
  File "/usr/lib/python2.7/subprocess.py", line 540, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['/usr/bin/nosetests', '~/git/safeview/service/test/nosetests/test_service/test_src/test_auth-server/test_main.py:ThreeLevelTests.test_authorized_email_reauth_240', '-v', '--rednose', '-s', '--nologcapture']' returned non-zero exit status 1
HH

$current = Pathname.pwd.realdirpath
def fixpath(path)
    if (path && !path.start_with?('/'))
        path = ($current + path).to_s
    end
    path
end

def showpath(path)
    "File \"#{fixpath(path)}\""
end

def hidepath(path)
    if path.include?('python2.7')
        path.sub!(/ File /,'')
    end
    path
end

indenting = false
# bo.each_line do |l|
$stdin.each_line do |l|
    if l.start_with?('   Traceback ')
        indenting = true
    elsif l.size < 3
        indenting = false
    end

    if indenting 
        l = l[3..-1]
        l.sub!(/^( +)(.+) line (\d+) /) {
            "#{$1} #{showpath($2)}, line #{$3}, " 
        }
    end
    puts hidepath(l)
end
