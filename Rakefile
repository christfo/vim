require 'fileutils'
require 'facets/string'
require 'ruby-debug'
require 'rake'
require 'find'
require 'pathname'

desc "Performs bundles cleanup (delete plugins installed from git source)"
task :cleanup do
  path = File.join(File.dirname(__FILE__), 'bundle')
  Dir.foreach(path) do |entry|
    if File.exist?(File.join(path, entry, ".git"))
      FileUtils.rm_rf(File.join(path, entry))
    end unless entry =~ /\.+/
  end
end

desc "Performs plugins update"
task :update do
  path = `pwd`.chomp / "bundle"  #File.join(Pathname.new(__FILE__).dirname, 'bundles')
  Dir.foreach(path) do |entry|
    bundle = File.join(path, entry)
    if File.exist?(File.join(bundle, ".git"))
      print "Updating #{entry}: "
      system("cd #{bundle} && git pull origin master")
      system("cd #{bundle} && git submodule update") unless `cd #{bundle} && git submodule`.empty?
    end unless entry =~ /\.+/
  end
end

desc "add softlinks to dotfiles in home directory and vim tempory dirs"
task :dotfiles do
  system("cd ~ && mkdir -p .vim-tmp/undodir")
  path = `pwd`.chomp / "dotfiles" / ".*" 
  ( Dir[path] + [`pwd`.chomp / ".vimrc" ] ).each do |dotfile|
      next if [".",".."].include? File.basename(dotfile)
      link = File.basename(dotfile)
      if File.exists?(File.expand_path("~" / link))
          link << ".new"
      end 
      system("cd ~ && ln -s #{dotfile} #{link}")
  end
end

desc "sync vimfiles in "
task :sync do
end

desc "init project"
task :init do
    Dir["bundle/*"].each { |mod|
      next if [".",".."].include? File.basename(mod)
      system("git submodule update --init #{mod}")
    }
end

desc "Remove a submodule from the bundle"
task :remove, :bundle do |t,args|
    bundle = args[:bundle]
    if bundle && Pathname.new( bundle ).exists
        puts "Not implemented" 
    end
end


# task :default => ['sync']
desc "=> base"
task :default => [:base]
