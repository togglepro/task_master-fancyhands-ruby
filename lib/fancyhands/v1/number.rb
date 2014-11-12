require "time"
require "json"

module FancyHands
  class Number
    def initialize(client)
      @client = client
    end

    def post(phone_number="")
      data = {
        :phone_number => phone_number
      }
      return @client.request.post("call/number", data)
    end
  
    def get(area_code=nil, contains=nil, region=nil)
      data = {
        :area_code => area_code,
        :contains => contains,
        :region => region
      }
      return @client.request.get("call/number", data)
    end

    def delete(phone_number=nil, key=nil)
      data = {
        :phone_number => phone_number,
        :key => key
      }
      return @client.request.delete("call/number", data)
    end

  end
end
