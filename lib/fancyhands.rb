require 'forwardable'

require_relative 'fancyhands/v1/client'

module FancyHands
  extend SingleForwardable
  def_delegators :key, :secret, :url
  
end
