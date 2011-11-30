require 'cora'
require 'siri_objects'

#######
# Remember to add other plugins to the "config.yml" file if you create them!
######

class SiriProxy::Plugin::MeaningOfLife < SiriProxy::Plugin
  def initialize(config)
    #if you have custom configuration options, process them here!
  end

  listen_for /meaning of life/i do
    lines = IO.readlines("mol.txt")
    rl = rand(lines.count-1)
    say lines[rl]
    request_completed
  end  

end
