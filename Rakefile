require 'rubygems'
require 'fileutils'
require 'facets/string'
#require 'ruby-debug'
require 'rake'
require 'find'
require 'pathname'
VIMDIR  = File.dirname(__FILE__)

desc "Performs bundles cleanup (delete plugins installed from git source)"
task :cleanup do
  path = File.join(VIMDIR, 'bundle')
  Dir.foreach(path) do |entry|
    if File.exist?(File.join(path, entry, ".git"))
      FileUtils.rm_rf(File.join(path, entry))
    end unless entry =~ /\.+/
  end
end


desc "add softlinks to dotfiles in home directory and vim tempory dirs"
task :dotfiles do
  # vim config
  system("mkdir -p ~/.local/share/vim/backup")
  system("mkdir -p ~/.local/share/vim/undo")
  system("mkdir -p ~/.local/share/vim/swap")

  # powerline config
  system("pip install -U --user git+git://github.com/Lokaltog/powerline")
  system("mkdir -p ~/.config/ && cd ~/.config && ln -s #{VIMDIR}/dotfiles/powerline")
  system("mkdir -p ~/bin")
  system("git submodule update --init binfiles/friendly-find")

  # font config
  system("mkdir -p ~/.fonts.conf.d && cp #{VIMDIR}/fonts/10-powerline-symbols.conf  ~/.fonts.conf.d/ ")
  system("mkdir -p ~/.config/fontconfig/conf.d && cp #{VIMDIR}/fonts/10-powerline-symbols.conf  ~/.config/fontconfig/conf.d/ ")
  system("mkdir -p ~/.fonts && cp #{VIMDIR}/fonts/* ~/.fonts")
  system("fc-cache -vf ~/.fonts");

  path = `pwd`.chomp / "dotfiles" / ".*" 
  ( Dir[path] + [`pwd`.chomp / ".vimrc" ] ).each do |dotfile|
      next if [".",".."].include? File.basename(dotfile)
      link = File.basename(dotfile)
      if File.exists?(File.expand_path("~" / link))
          link << ".new"
      end 
      system("cd ~ && ln -s #{dotfile} #{link}")
  end
  path = `pwd`.chomp / "binfiles" / "*" 
  ( Dir[path] ).each do |binfile|
      next if [".",".."].include? File.basename(binfile)
      link = File.basename(binfile)
      if File.exists?(File.expand_path("~/bin" / link))
          link << ".new"
      end 
      system("cd ~/bin && ln -s #{binfile} #{link}")
  end
end

desc "sync vimfiles in #{}"
task :sync do
end



task :default => [:dotfiles]
