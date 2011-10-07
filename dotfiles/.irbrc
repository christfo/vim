require 'rubygems'
require 'ruby-debug'
require 'wirble'
require 'utility_belt'
require 'irb/completion'
require 'term/ansicolor'
require 'ap'
require 'pp'

class Color
    extend Term::ANSIColor
    def self.light_gray 
        "\033[0;37m"
    end

    def self.gray
        "\033[1;30m"
     end
end

#ARGV.concat["--readline", "--propmt-mode", "simple" ]

colors = Wirble::Colorize.colors.merge({
    :object_class   => :black,
    :class	  => :dark_grey,
    :symbol   => :red,
    :symbol_prefix  => :blue,
})

Wirble::Colorize.colors = colors
Wirble.init
Wirble.colorize 



def quick( reps=100, &block)
  require 'benchmark'
  Benchmark.bmbm do |b|
  b.report { reps.times &block }
  end
  nil
end

class Object
extend Term::ANSIColor
#    ANSI_BOLD       = "\033[1m"
#    ANSI_RESET      = "\033[0m"
#    ANSI_LGRAY    = "\033[0;37m"
#    ANSI_GRAY     = "\033[1;30m"

# Print object's methods
def pm(*options)
    methods = self.methods
    methods -= Object.methods unless options.include? :more
    methods -= IRB.methods unless options.include? :more
    filter = options.select {|opt| opt.kind_of? Regexp}.first
    methods = methods.select {|name| name =~ filter} if filter

    data = methods.sort.collect do |name|
        method = self.method(name)
        if method.arity == 0
            args = "()"
        elsif method.arity > 0
            n = method.arity
            args = "(#{(1..n).collect {|i| "arg#{i}"}.join(", ")})"
        elsif method.arity < 0
            n = -method.arity
            args = "(#{(1..n).collect {|i| "arg#{i}"}.join(", ")}, ...)"
        end
        klass = $1 if method.inspect =~ /Method: (.*?)#/
            [name, args, klass]
    end
    max_name = data.collect {|item| item[0].size}.max
    max_args = data.collect {|item| item[1].size}.max
    data.each do |item| 
        #print " #{ANSI_BOLD}#{item[0].rjust(max_name)}#{ANSI_RESET}"
        #print "#{ANSI_GRAY}#{item[1].ljust(max_args)}#{ANSI_RESET}"
        #print "   #{ANSI_LGRAY}#{item[2]}#{ANSI_RESET}\n"

        print Color.bold,       "#{item[0].rjust(max_name)}", Color.clear
        print Color.gray,       "#{item[1].ljust(max_args)}", Color.clear
        print Color.light_gray, "   #{item[2]}\n", Color.clear
    end
    data.size
end
end

require 'irb/completion'
require 'irb/ext/save-history'

# For vim integration
begin
    require 'interactive_editor'
rescue LoadError
    puts "interactive_editor is not installed. To enable, run: gem install interactive_editor"
end

# http://drnicutilities.rubyforge.org/map_by_method/
begin
    require 'map_by_method'
rescue LoadError
    puts "map_by_method is not installed. To enable, run: gem install map_by_method"
end

# Dr Nic's gem inspired by
# http://redhanded.hobix.com/inspect/stickItInYourIrbrcMethodfinder.html
begin
    require 'what_methods'
rescue LoadError
    puts "what_methods is not installed. To enable, run: gem install what_methods"
end

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

# Load the readline module.
IRB.conf[:USE_READLINE] = true

# Automatic Indentation
IRB.conf[:AUTO_INDENT]=true

# Save History between irb sessions
require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

# http://sketches.rubyforge.org/
begin
  require 'sketches'
  Sketches.config :editor => 'mvim'
rescue LoadError
   puts "sketches is not installed. To enable, run: gem install sketches"
end

# Easily print methods local to an object's class
class Object
   def local_methods
       (methods - Object.instance_methods).sort
   end
end




