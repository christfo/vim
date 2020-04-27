#!/usr/bin/env ruby

fdat = `sudo cat /var/log/safeview/safeview-surrogate.log`
ps = `sudo ps aux`.lines

navs = fdat.each_line.map(&:chomp).select { |line|
    line =~ /surrogate-nav-main-frame-navigated/
}

url_match = ARGV[0] || ''

def extract(line)
    match = /time="(.+?)" .*url="(.+?)".+ id=(.+?)-[0-9]+ /.match(line)
    return match[3] , match[2] + "  " + match[1] 
end

dict = {}
navs.each { |n|
     k, v = extract(n)
     dict[k] = v
}

class String
  # colorization
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end
end


maybe = dict.map { |k, v| 
    res = ps.select{ |l| l.include? k and l.include? "surrogate-server-address" }
    next if res.empty?
    next unless v.include? url_match
    res = /surrogate\-server\-address=(.+?) /.match(res[0])
    # puts  "ssh -L 7778:#{res[1]}:7778  #{`hostname`.chomp}  -N   # #{v}"
    "ssh -L 7778:#{res[1]}:7778  localhost -g  -N   # #{v.green}"
}.compact

if maybe.empty?
    puts "No match in #{dict.values.join(', ')}"
else 
    puts "Select from the following:"
    maybe.each_with_index { |v, i|
        puts "#{i}) #{v}"
    }
    indx = maybe.length == 1 ? 0 : gets.to_i
    puts "Connecting to #{maybe[indx]}" 
    puts 
    puts "Visit 'http://#{`hostname`.chomp}:7778' from your browser"
    `#{maybe[indx]}`
end


