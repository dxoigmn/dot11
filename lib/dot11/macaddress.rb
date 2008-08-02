module Dot11
  class MACAddress
    include Comparable
  
    attr_accessor :prefix_length  
  
    def initialize(address)
      if address.kind_of?(Integer)
        @address = [address].pack("Q").unpack("C8")[0, 6].reverse
      elsif address.kind_of?(String) && address =~ /^(.*?)(?:\/(.*))?$/
        @prefix_length = $2.to_i
        
        @address = $1.split(":").map {|octet| octet.to_i(16)}
      elsif address.kind_of?(Array)
        @address = address
      end 
    end
  
    def to_i
      ("\x00\x00" + @address.pack("C6")).reverse.unpack("Q")[0]
    end
  
    def to_s
      @address.map{|byte| "%02x" % byte}.join(":") + (@prefix_length == 0 ? "" : "/#{@prefix_length}")
    end
  
    def inspect
      to_s
    end
  
    def to_arr
      @address
    end
  
    def [](*index)
      @address[*index]
    end
  
    def eql?(other)
      to_i == other.to_i
    end
  
    def ==(other)
      eql?(other)
    end
  
    def hash
      to_i.hash
    end
  end
end