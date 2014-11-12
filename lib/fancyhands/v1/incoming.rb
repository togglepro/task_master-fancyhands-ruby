require "time"
require "json"

module FancyHands
  class Incoming
    def initialize(client)
      @client = client
    end

    def post(phone_number="", conversation={})
      data = {
        :phone_number => phone_number,
        :conversation => JSON.generate(conversation)
      }
      return @client.request.post("call/incoming", data)
    end
  
    def get(phone_number="", key="", cursor="")
      data = {
        :phone_number => phone_number,
        :key => key,
        :cursor => cursor
      }
      return @client.request.get("call/incoming", data)
    end

    def put(phone_number=nil, key=nil, conversation={})
      data = {
        :phone_number => phone_number,
        :conversation =>  JSON.generate(conversation)
      }
      return @client.request.put("call/incoming", data)
    end

    def delete(phone_number='', key='')
      data = {
        :phone_number => phone_number,
        :key => key
      }
      return @client.request.delete("call/incoming", data)
    end

  end
end
