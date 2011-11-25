require 'fileutils'

desc "Performs base installation"
task :base do
end

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
  path = File.join(File.dirname(__FILE__), 'bundles')
  Dir.foreach(path) do |entry|
    bundle = File.join(path, entry)
    if File.exist?(File.join(bundle, ".git"))
      print "Updating #{entry}: "
      system("cd #{bundle} && git pull")
      system("cd #{bundle} && git submodule update") unless `cd #{bundle} && git submodule`.empty?
    end unless entry =~ /\.+/
  end
end

desc "=> base"
task :default => [:base]
