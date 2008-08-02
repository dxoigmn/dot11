class String
  def indent(depth)
    indented = ""
    self.each_line do |line|
      indented += " " * depth + line
    end
    
    indented
  end
end

require File.expand_path(File.join(File.dirname(__FILE__), 'dot11', 'packet'))
require File.expand_path(File.join(File.dirname(__FILE__), 'dot11', 'packetset'))
require File.expand_path(File.join(File.dirname(__FILE__), 'dot11', 'macaddress'))
require File.expand_path(File.join(File.dirname(__FILE__), 'dot11', 'dot11'))
require File.expand_path(File.join(File.dirname(__FILE__), 'dot11', 'raw'))
require File.expand_path(File.join(File.dirname(__FILE__), 'dot11', 'radiotap'))
