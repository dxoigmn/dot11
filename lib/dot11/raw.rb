require File.expand_path(File.join(File.dirname(__FILE__), 'packet'))

module Dot11
  class Raw < Packet
    attr_accessor :data
  
    def to_s
      "Raw\n" +
      "------\n" +
      "data: #{data.inspect}\n"
    end
  
    private
  
    def dissect(data)
      @data = data
    end
  end
end