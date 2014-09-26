require "time"
require "addressable/uri"
require "json"

require_relative 'request'

module FancyHands
  class Client

    attr_accessor :standard

    def initialize(key, secret, url="https://www.fancyhands.com/api/v1/")
      puts("HERE")
      @key = key
      @secret = secret
      @url = url
      set_up_resources()
    end

    def set_up_resources
      puts("HERE")
      @request = Request.new(@key, @secret, @url)
      @standard = Standard(self)
      puts("HERE")
    end

    # def Standard
    #   @standard
    # end

    # def request
    #   @request
    # end
        
    def message_post(key="", message="")
      data = {
        :key => key,
        :message => message,
      }
      return @request.post("request/standard/messages", data)
    end
  
    def custom_post(title="", description="", bid=0.0, expiration_date="", custom_fields={})
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
      return @request.post("request/custom", data)
    end
  
  
    def custom_get(key="", status="", cursor="")
      data = {
        :key => key,
        :status => status,
        :cursor => cursor
      }
      return @request.get("request/custom", data)
    end
  
  
    def call_post(phone="", conversation={}, title="", _retry="", retry_delay="", retry_limit="")
      data = {
        :phone => phone,
        :conversation => JSON.generate(conversation),
        :title => title,
        :retry => _retry,
        :retry_delay => retry_delay,
        :retry_limit => retry_limit,
      }
      return @request.post("call", data)
    end
  
  
    def call_get(key="", status="", cursor="")
      data = {
        :key => key,
        :status => status,
        :cursor => cursor
      }
      return @request.get("call", data)
    end
  
  
    # we only have the post here... probably not an issue
    def echo(data)
      return @request.post("echo", data)
    end
  end
end

