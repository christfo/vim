#!/usr/bin/env ruby
require 'rubygems'
require 'awesome_print'
require 'facets/string'


def ask(prompt)
    loop do
        print prompt, ' '
        $stdout.flush
        s = gets
        exit if s == nil
        s.chomp!
        if s == 'y' or s == 'yes'
            return true
        elsif s == 'n' or s == 'no'
            return false
        else
            $stderr.puts "Please answer yes or no."
        end
    end
end

target = ARGV[1] || "."
files  = Dir[target / "**/*" ] - [ "..", "." ]
files.select! { |item| item =~ /[0-9a-z]{8}_default/ }
transform = files.map { |item|
    newname = item.gsub(/_[0-9a-z]{8}_default/,"")
    newname = newname.gsub(/_-_-/,"")
    newname = newname.gsub(/_/," ")
    "mv  #{item.quote}  #{newname.quote}"
}

ap transform#.map { |i| i[1] }

if (ask "proceed?")
    transform.each { |cmd|
        `#{cmd}`
    }
end
