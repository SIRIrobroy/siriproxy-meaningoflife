require 'cora'
require 'siri_objects'

#######
# Remember to add other plugins to the "config.yml" file if you create them!
######

class SiriProxy::Plugin::MeaningOfLife < SiriProxy::Plugin
  def initialize(config = {})
  @config = config 
    
  #  ::MeaningOfLife.configure do |config|
  #    config.phrase_file = @config['phrase_file'] 
  #  end
    
  end

  listen_for /meaning of life/i do
    lines = IO.readlines(File.dirname(File.dirname(__FILE__))+"/mol.txt")
    rl = rand(lines.count-1)
    say lines[rl]
    request_completed
  end  

end
