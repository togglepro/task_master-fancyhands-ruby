Gem::Specification.new do |s|
  s.name        = 'task_master-fancyhands-ruby'
  s.version     = '1.0.1'
  s.date        = '2014-09-26'
  s.summary     = "Fancy Hands"
  s.description = "A fork of the official ruby gem for the Fancy Hands API"
  s.authors     = ["Sean Devine"]
  s.email       = 'barelyknown@icloud.com'
  s.files       = ["lib/fancyhands.rb",
                   "lib/fancyhands/v1/outgoing.rb",
                   "lib/fancyhands/v1/number.rb",
                   "lib/fancyhands/v1/incoming.rb",
                   "lib/fancyhands/v1/history.rb",
                   "lib/fancyhands/v1/client.rb",
                   "lib/fancyhands/v1/custom.rb",
                   "lib/fancyhands/v1/echo.rb",
                   "lib/fancyhands/v1/message.rb",
                   "lib/fancyhands/v1/request.rb",
                   "lib/fancyhands/v1/standard.rb"
				   ]
  s.homepage    = 'https://github.com/togglepro/task_master-fancyhands-ruby'
  s.license       = 'MIT'

  s.add_runtime_dependency "oauth"
  s.add_runtime_dependency "addressable"
end
