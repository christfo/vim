require 'fileutils'
require 'facets/string'
require 'ruby-debug'
require 'rake'
require 'find'
require 'pathname'

desc "Performs bundles cleanup (delete plugins installed from git source)"
task :cleanup do
  path = File.join(File.dirname(__FILE__), 'bundles')
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

desc "add dotfiles"
task :dotfiles do
  path = `pwd`.chomp / "dotfiles"  
  Dir.foreach(path) do |dotfile|
      link = "~" / File.basename(dotfile)
      if File.exist? link
          link << ".new"
      end 
      puts("cd ~ && ln -s #{dotfile} link")
  end
end

IGNORE_FILES = [/^\.gitignore$/, /^Rakefile$/,/^README.textile$/,/^\.gitmodules$/]

files = `git ls-files`.split("\n").reject! {|f| f.match(/^bundle/)}

target_dir=File.expand_path("~")

Dir["bundle/**/*"].each { |file|
  files << file unless File.directory?(file)
}

files.reject! { |f| IGNORE_FILES.any? { |re| f.match(re) } }

desc "sync vimfiles in #{target_dir}"
task :sync do
  files.each do |file|
    if File.exists?(file)
      target_file = File.join(target_dir, ".#{file}")
      FileUtils.mkdir_p File.dirname(target_file)
      FileUtils.cp file, target_file

      puts "Installed #{file} to #{target_file}"
    else
      puts "#{file} removed?"
    end
  end
  command_t_path=File.join(File.expand_path("~"),".vim","bundle","command-t")
  system("cd #{command_t_path}; rake make")
end

desc "init project"
task :init do
  system("git submodule init")
  system("git submodule update")
end

desc 'update the installed bundles'
task :update_bundles do
  bundles = `git submodule | cut -d' ' -f3`.split("\n")
  bundles.each do |bundle|
    system("cd #{bundle} && git pull origin master")
  end
end

# task :default => ['sync']
desc "=> base"
task :default => [:base]
