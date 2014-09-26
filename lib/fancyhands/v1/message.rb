require "time"

module FancyHands
  class Message
    def initialize(client)
      @client = client
    end

    def post(key="", message="")
      data = {
        :key => key,
        :message => message,
      }
      return @client.request.post("request/standard/messages", data)
    end
  end
end
