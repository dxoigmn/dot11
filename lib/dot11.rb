class String
  def indent(depth)
    indented = ""
    self.each_line do |line|
      indented += " " * depth + line
    end
    
    indented
  end
end

require 'dot11/packet'
require 'dot11/packetset'
require 'dot11/macaddress'
require 'dot11/dot11'
require 'dot11/raw'
require 'dot11/radiotap'
