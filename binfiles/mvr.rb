#!/usr/bin/env ruby 

# mvr, a regexp-based file renamer in Ruby
# hacked together by Jakob van Santen, 27.12.2005
# jakob@somethingpretentious.net, http://notes.somethingpretentious.net
# you may do whatever you damn well please with this code, as long as you retain this comment header 
$displaywidth = 80

def help
    print %Q(#{$0.split("/").last} 0.1, a regexp-based file renamer in Ruby
    Usage: #{$0.split("/").last} [OPTIONS] [FILES]

    If not passed a list of files, #{$0.split("/").last} will operate on all files in the current directory.

    It is important that all regular expression be single-quoted when given on the command line, as the shell will strip all backslashes.

    Options:
    -s='aString'    String to search for in the file names. 
    -r='aString'    String to replace the search string with in the file names.
    -file=blah.x    Read regular expressions from given script file /search/replace/, like sed
    -fastloose      Run in Fast and Loose mode, only asking for confirmation once. Only works when a batchfile is given as above.
    -help           Display this help.

    Supported regular expressions are all those supported by Ruby.
    )
end
if ((ARGV.empty? || ARGV.nil?) && ($s.nil? || $r.nil?) && $file.nil? && $fastloose.nil?) || !($help.nil?)
    help()
    exit  
end
# If files are passed to the program, restrict operation to those files; otherwise, operate on all files in the directory
if ARGV.empty?
    filelist = Dir.entries(".").delete_if {|name| /^\./.match(name)}
else
    filelist = ARGV
end
$actions = []
if $file.nil? and !($fastloose.nil?)
    puts "You must supply a batchfile with 'file=blah' to use Fast and Loose mode" 
    exit
end
unless $file.nil?
    scriptFile = File.new($file)
    scriptFile.each_line do |line|
        next unless line =~ /^\//
        exit unless line =~ /\/(.*?)\/(.*?)\//
        $actions.push( [Regexp.compile($1),$2] )
    end
else
    if $s.nil?
        print "Replace this regular expression: "
        matchstring = STDIN.gets.chomp
    else
        matchstring = $s
    end
    if $r.nil?
        print "With this regular expression: "
        replacestring = STDIN.gets.chomp
    else
        replacestring = $r
    end
    $actions.push([Regexp.compile(matchstring), replacestring])
end

unless $fastloose.nil?
    filelist.collect! {|filename| [filename, filename]}
    $actions.each do |set|
        #filelist.delete_if {|name| !(set[0].match(name))}
        filelist.collect! do |entry|
            # This filthiness is neccessary to protect the unlying directories in the case where an absolute path to the file is passed
            splits = entry[1].split("/")
            newname = splits.pop.gsub(set[0], set[1])
            newname = splits.join("/")+"#{if entry[1] =~ /\// then "/" else end}"+newname 
            [entry[0], newname]
        end
        # Reset the list to reflect current file names, rinse, repeat
        #filelist.collect! {|entry| entry[1].to_s}
    end
    puts "Will now perform the following operations:"
    puts "Fast and Loose Mode".center($displaywidth)
    filelist.each do |entry| 
        next if entry[0] == entry[1]
        puts "-"*$displaywidth
        print "| #{entry[0]}"
        print " "*($displaywidth-"| #{entry[0]}".length-1)+"|\n"
        print "| #{entry[1]}"
        print " "*($displaywidth-"| #{entry[1]}".length-1)+"V\n"
    end
    puts "-"*$displaywidth
    puts "Are you sure you want to rename these files? This operation cannot be undone.\nType 'y' to continue, anything else to exit"
    confirm = STDIN.gets.chomp
    if confirm =~ /(y|Y)/
        filelist.each do |entry|
            system("mv -v '#{entry[0]}' '#{entry[1]}'") unless entry[0] == entry[1] 
        end
    else
        puts "Aborting, have a nice day..."
    end

else
    $actions.each do |set|
        #filelist.delete_if {|name| !(set[0].match(name))}
        filelist.collect! do |filename|
            # This filthiness is neccessary to protect the unlying directories in the case where an absolute path to the file is passed
            splits = filename.split("/")
            newname = splits.pop.gsub(set[0], set[1])
            newname = splits.join("/")+"#{if filename =~ /\// then "/" else end}"+newname 
            [filename, newname]
        end
        puts "Will now perform the following operations:"
        filelist.each {|entry| puts "#{entry[0]}\t-> #{entry[1]}" if entry[0] =~ set[0]}
        puts "Are you sure you want to rename these files? This operation cannot be undone.\nType 'y' to continue, anything else to exit"
        confirm = STDIN.gets.chomp
        if confirm =~ /(y|Y)/
            filelist.each do |entry|
                system("mv -v '#{entry[0]}' '#{entry[1]}'") if entry[0] =~ set[0]       
            end
        else
            puts "Aborting, have a nice day..."
        end
        # Reset the list to reflect current file names, rinse, repeat
        filelist.collect! {|entry| entry[1].to_s}
    end
end

