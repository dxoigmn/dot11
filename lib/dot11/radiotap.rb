require File.expand_path(File.join(File.dirname(__FILE__), 'packet'))

module Dot11
  class Radiotap < Packet
    attr_accessor :revision, :pad, :stuff_length, :stuff
  
    def data
      raise "This space intentionally left blank"
    end
  
    def to_s
      "Radiotap\n" + 
      "-------------\n" + 
      "payload:\n" +
      payload.to_s.indent(6)
    end
  
    def payload
      return @payload if @payload

      @payload = Dot11.new(@rest)
    end
  
    private
  
    def dissect(data)
      fields = data.unpack("CCv")
    
      @data = data
      @revision = fields[0]
      @pad = fields[1]
      @stuff_length = fields[2]
    
      @rest = data[@stuff_length..-1]
    end
  end
end
