require "oauth"
require "time"
require "addressable/uri"
require "json"

require_relative "fancyhands/request"

class Fancyhands

  def initialize(key, secret, url="https://www.fancyhands.com/api/v1/")
    @key = key
    @secret = secret
    @url = url
    @consumer = OAuth::Consumer.new(@key, @secret)
  end

  def post(piece, data="")
    response = @consumer.request(:post, @url + piece, nil, {}, data)
    return JSON.parse(response.body)
  end

  def get(piece, data="")
    if data
      uri = Addressable::URI.new
      uri.query_values = data
      data = uri.query
    end
    full = @url + piece + "?" + data
    response = @consumer.request(:get, full)
    return JSON.parse(response.body)
  end


  def message_post(key="", message="")
    data = {
      :key => key,
      :message => message,
    }
    return self.post("request/standard/messages", data)
  end


  def standard_post(title="", description="", bid=0.0, expiration_date="")
    if !expiration_date
      expiration_date = DateTime.now + 1
    end
    data = {
      :title => title,
      :description => description,
      :bid => bid,
      :expiration_date => expiration_date.strftime("%Y-%m-%dT%H:%M:%SZ"),
    }
    return self.post("request/standard", data)
  end


  def standard_get(key="", status="", cursor="")
    data = {
      :key => key,
      :status => status,
      :cursor => cursor
    }
    return self.get("request/standard", data)
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
    return self.post("request/custom", data)
  end


  def custom_get(key="", status="", cursor="")
    data = {
      :key => key,
      :status => status,
      :cursor => cursor
    }
    return self.get("request/custom", data)
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
    return self.post("call", data)
  end


  def call_get(key="", status="", cursor="")
    data = {
      :key => key,
      :status => status,
      :cursor => cursor
    }
    return self.get("call", data)
  end


  # we only have the post here... probably not an issue
  def echo(data)
    return self.post("echo", data)
  end


end
