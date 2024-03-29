require 'cora'
require 'siri_objects'

#######
# Remember to add other plugins to the "config.yml" file if you create them!
######

class SiriProxy::Plugin::MeaningOfLife < SiriProxy::Plugin
  attr_accessor :phrase_file
  attr_accessor :phrase_file_1
  
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
      
    if File.exist? x
      self.phrase_file_1 = x
    else
      self.phrase_file_1 = File.dirname(File.dirname(__FILE__))+"/mol_1.txt"
    end

  #  ::MeaningOfLife.configure do |config|
  #    config.phrase_file = @config['phrase_file'] 
  #  end
    
  end

  listen_for /wie geht's/i do
    lines = IO.readlines(self.phrase_file)
    rl = rand(lines.count-1)
    say lines[rl]
    request_completed
  end
  
 end