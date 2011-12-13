require 'cora'
require 'siri_objects'

#######
# Remember to add other plugins to the "config.yml" file if you create them!
######

class SiriProxy::Plugin::MeaningOfLife < SiriProxy::Plugin
  attr_accessor :phrase_file
  
  def initialize(config = {})

    if config["phrase_file"].nil?
      x = ""
    else
      x = config["phrase_file"]
    end
    
   if config["phrase_file_1"].nil?
      x = ""
    else
      x = config["phrase_file_1"]
    end  
    
    if File.exist? x
      self.phrase_file = x
    else
      self.phrase_file = File.dirname(File.dirname(__FILE__))+"/mol.txt"
    end

  #  ::MeaningOfLife.configure do |config|
  #    config.phrase_file = @config['phrase_file'] 
  #  end
    
  end

  listen_for /tor im zaun/i do
    lines = IO.readlines(self.phrase_file)
    rl = rand(lines.count-1)
    say lines[rl]
    request_completed
  end
  
  listen_for /tor macht auf/i do
    lines = IO.readlines(self.phrase_file_1)
    rl = rand(lines.count-1)
    say lines[rl]
    request_completed
  end
 end