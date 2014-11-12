require "time"
require "json"

module FancyHands
  class History
    def initialize(client)
      @client = client
    end
  
    def get(key="", phone_number="", cursor="")
      data = {
        :key => key,
        :phone_number => phone_number,
        :cursor => cursor
      }
      return @client.request.get("call/history", data)
    end

  end
end
