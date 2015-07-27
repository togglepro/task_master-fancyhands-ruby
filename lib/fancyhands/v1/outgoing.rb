require "time"
require "json"

module FancyHands
  class Outgoing
    def initialize(client)
      @client = client
    end

    def post(phone="", conversation={}, title="", record="", _retry="", retry_delay="", retry_limit="", call_window_start=nil, call_window_end=nil, timeout=nil, voicemail=false)
      data = {
        :phone => phone,
        :conversation => JSON.generate(conversation),
        :title => title,
        :record => record,
        :retry => _retry,
        :retry_delay => retry_delay,
        :retry_limit => retry_limit,
        :timeout => timeout,
        :voicemail => voicemail,
      }

      if call_window_start and call_window_end
        data[:call_window_start] = call_window_start.strftime("%Y-%m-%dT%H:%M:%SZ")
        data[:call_window_end] = call_window_end.strftime("%Y-%m-%dT%H:%M:%SZ")
      end

      return @client.request.post("call/outgoing", data)
    end

    def get(key="", status="", cursor="")
      data = {
        :key => key,
        :status => status,
        :cursor => cursor
      }
      return @client.request.get("call/outgoing", data)
    end

  end
end
