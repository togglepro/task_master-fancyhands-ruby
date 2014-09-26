module FancyHands
  class Echo
    def initialize(client)
      @client = client
    end

    def post(data)
        return @client.request.post("echo", data)
    end

    def get(data)
        return @client.request.get("echo", data)
    end
  end
end
