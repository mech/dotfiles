require 'rubygems'
require 'wirble'
require 'hirb'
require 'ap'
require 'pp'

Wirble.init
Wirble.colorize
Hirb.enable

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:EVAL_HISTORY] = 200

class Object
 def local_methods
   (methods - Object.instance_methods).sort
 end
end

alias q exit

# script/console
script_console_running = ENV.include?('RAILS_ENV') && IRB.conf[:LOAD_MODULES] && IRB.conf[:LOAD_MODULES].include?('console_with_helpers')
rails_running = ENV.include?('RAILS_ENV') && !(IRB.conf[:LOAD_MODULES] && IRB.conf[:LOAD_MODULES].include?('console_with_helpers'))

if script_console_running
 require 'logger'
 Object.const_set(:RAILS_DEFAULT_LOGGER, Logger.new(STDOUT))
end

IRB.conf[:PROMPT][:CUSTOM] = {
 :PROMPT_N => ENV.include?('RAILS_ENV') ? "[#{Rails.env}] >> " : "irb >> ",
 :PROMPT_I => ENV.include?('RAILS_ENV') ? "[#{Rails.env}] >> " : "irb >> ",
 :PROMPT_S => nil,
 :PROMPT_C => "?> ",
 :RETURN => "=> %s\n"
}

IRB.conf[:PROMPT_MODE] = :CUSTOM

def me
 User.find_by_email "mech@me.com"
end

def srid
 Employment.id "S6414"
end
