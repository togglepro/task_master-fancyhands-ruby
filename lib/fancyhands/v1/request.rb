require "oauth"
class Request

  def initialize(key, secret, url)
    @url = url
    @consumer = OAuth::Consumer.new(key, secret)
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

end
