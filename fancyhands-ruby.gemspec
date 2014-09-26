Gem::Specification.new do |s|
  s.name        = 'fancyhands-ruby'
  s.version     = '1.0.0'
  s.date        = '2014-09-26'
  s.summary     = "Fancy Hands"
  s.description = "A ruby gem for the Fancy Hands API"
  s.authors     = ["Ted Roden"]
  s.email       = 'tedroden@fancyhands.com'
  s.files       = ["lib/fancyhands.rb",  
                   "lib/fancyhands/v1/call.rb",	
                   "lib/fancyhands/v1/client.rb",
                   "lib/fancyhands/v1/custom.rb",
                   "lib/fancyhands/v1/echo.rb",
                   "lib/fancyhands/v1/message.rb",
                   "lib/fancyhands/v1/request.rb",
                   "lib/fancyhands/v1/standard.rb"
				   ]
  s.homepage    = 'https://github.com/fancyhands/fancyhands-ruby'
  s.license       = 'MIT'
end

# requires oatuh, addressable
