Browsermob Ruby Restclient SDK
====

Master

[![Build Status](https://travis-ci.org/thamilton2014/browsermob_ruby.svg?branch=master)](https://travis-ci.org/thamilton2014/browsermob_ruby)

Development

[![Build Status](https://travis-ci.org/thamilton2014/browsermob_ruby.svg?branch=development)](https://travis-ci.org/thamilton2014/browsermob_ruby)

Getting Started
---

```ruby
require "browsermob"

Browsermob::Util::Config.configure do |config|

	config[:endpoints][:base_url] = "localhost:port"
	
end

@client = Browsermob::API.new

@client.create_proxy

```

SDK Documentation is hosted at http://
---


