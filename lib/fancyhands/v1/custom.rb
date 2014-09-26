require "time"

module FancyHands
  class Custom
    def initialize(client)
      @client = client
    end

    def post(title="", description="", bid=0.0, expiration_date=nil, custom_fields={})
      if !expiration_date
        expiration_date = DateTime.now + 1
      end
      data = {
        :title => title,
        :description => description,
        :bid => bid,
        :expiration_date => expiration_date.strftime("%Y-%m-%dT%H:%M:%SZ"),
        :custom_fields => custom_fields,
      }
      return @client.request.post("request/custom", data)
    end
    
    def get(key="", status="", cursor="")
      data = {
        :key => key,
        :status => status,
        :cursor => cursor
      }
      return @client.request.get("request/custom", data)
    end
  end
end
