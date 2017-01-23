require 'rubygems'
require 'awesome_print'
require 'irb/completion'

AwesomePrint.irb!

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:EVAL_HISTORY] = 200

class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end

alias q exit
