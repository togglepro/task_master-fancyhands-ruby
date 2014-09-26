require "time"
require "json"

module FancyHands
  class Call
    def initialize(client)
      @client = client
    end

    def post(phone="", conversation={}, title="", _retry="", retry_delay="", retry_limit="")
      data = {
        :phone => phone,
        :conversation => JSON.generate(conversation),
        :title => title,
        :retry => _retry,
        :retry_delay => retry_delay,
        :retry_limit => retry_limit,
      }
      return @client.request.post("call", data)
    end
  
  
    def get(key="", status="", cursor="")
      data = {
        :key => key,
        :status => status,
        :cursor => cursor
      }
      return @client.request.get("call", data)
    end

  end
end
