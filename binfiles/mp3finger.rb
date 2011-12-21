require 'rubygems'
require "mp3info"
require "pp"
require 'digest/md5'


def doDir( dirname )
    dir = Dir.new(dirname)
    
    dir.each do |file|
        next if /^\./ =~ file
        
        doDir("#{dir.path}/#{file}") if File.directory?("#{dir.path}/#{file}")
       
        next unless /\.mp3$/ =~ file
        
        mp3file = "#{dir.path}/#{file}"
        
        Mp3Info.open(mp3file) do |mp3|
            datloc = mp3.audio_content()
        
            datloc[0] += 7 if mp3.hastag2? # dunno?
            datloc[1] -= 7 if mp3.hastag2? # dunno?
          
        
            f      = open(mp3file,"rb")
            f.pos  = datloc[0]
            sum    = Digest::MD5.hexdigest( f.read(datloc[1]) )
            f.close
            puts "#{sum} [#{datloc[0]},#{datloc[1]}] #{"ID3v1" if mp3.hastag1?} #{"ID3v2"if mp3.hastag2?} #{} \"#{dir.path}/#{file}\""
      end 
    end
end

doDir(ARGV[0])
