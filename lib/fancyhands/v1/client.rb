require "time"
require "addressable/uri"
require "json"

require_relative 'request'
require_relative 'echo'
require_relative 'standard'
require_relative 'message'
require_relative 'custom'
require_relative 'call'

module FancyHands
  module V1
    class Client

      attr_accessor :request
  
      def initialize(key, secret, url="https://www.fancyhands.com/api/v1/")
        @request = Request.new(key, secret, url)
        @_standard = @_echo = @_custom = @_message = @_call = nil 
      end

      # Lazy load standard
      def Standard
        if !@_standard
          @_standard = Standard.new(self)
        end
        @_standard
      end

      # Lazy load echo
      def Echo
        if !@_echo
          @_echo = Echo.new(self)
        end
        @_echo
      end

      # Lazy load custom
      def Custom
        if !@_custom
          @_custom = Custom.new(self)
        end
        @_custom
      end

      # Lazy load message
      def Message
        if !@_message
          @_message = Message.new(self)
        end
        @_message
      end
    
      # Lazy load Call
      def Call
        if !@_call
          @_call = Call.new(self)
        end
        @_call
      end

    end
  end
end

