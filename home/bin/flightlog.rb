#!/usr/bin/env ruby

$stdin.each_line do |l|
    # puts l.gsub!(/._file=(.+) .*line=(\d+)(.+)/, "Warning:\1:\2  \3")
    puts l.gsub(/.*file=..\/(.+) .*line=(\d+)(.+)/, '\1:\2: warning: \3')
end
