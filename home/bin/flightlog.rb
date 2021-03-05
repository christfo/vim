#!/usr/bin/env ruby


begin
  io = ARGV[0] ? File.open(ARGV[0], 'w+') : $stdout.dup
  $stdin.each_line do |l|
      # puts l.gsub!(/._file=(.+) .*line=(\d+)(.+)/, "Warning:\1:\2  \3")
    io << l.gsub(/.*file=..\/..\/(.+) .*line=(\d+)(.+)/, '\1:\2: warning: \3')
  end
ensure
  io.close
end
