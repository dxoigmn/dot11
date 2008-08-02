require 'packetset'

module Dot11
  class Packet
    class <<self
      alias older_new new
    
      def new(parameters = {})
        # Maybe we shouldn't do it this way, but it looks prettier
        if !parameters.kind_of?(String) && parameters.values.any? {|v| v.kind_of?(Array) || v.kind_of?(Range)}
          Dot11::PacketSet.new(self, parameters)
        else
          older_new(parameters)
        end
      end
    end
    
    def initialize(parameters = {})
      if parameters.kind_of?(String)
        dissect(parameters)
      elsif parameters.kind_of?(Hash)
        parameters.each_pair do |key, value|
          send((key.to_s + "=").intern, value)
        end
      end
    end
  
    def =~(other)
      if other.kind_of?(Hash)
        other.each_pair do |key, value|
          return false if self.send(key) != value
        end
      
        return true
      end
    end
    
    def to_filter
      PacketSet.new(self.class, self.instance_variables.inject({}) do |accum, var| 
        accum[var[1..-1].intern] = self.instance_variable_get(var).kind_of?(MACAddress) ? self.instance_variable_get(var).to_s : self.instance_variable_get(var).to_s
        accum
      end).to_filter
    end
  end
end