require_relative 'lib/version'

Gem::Specification.new do |s|

  s.name        = 'browsermob'
  s.version     = Browsermob::SDK::VERSION
  s.platform    = Gem::Platform::RUBY
  s.summary     = ""
  s.description = ""
  s.authors     = ["thamilton2014@github.com"]
  s.summary     = %q{}
  s.email       = 'thamilton2014@github.com'
  s.license     = ''

  s.files       = [
                    'browsermob.gemspec',
                    'README.md'
                  ]

  s.files += Dir["lib/browsermob/services/*.rb"]
  s.files += Dir["lib/*.rb"]
  s.files += Dir["lib/browsermob/*.rb"]
  s.files += Dir["lib/browsermob/util/*.rb"]
  s.executables = []
  s.require_paths = ["lib"]

end