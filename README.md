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
```

Creating new port

```ruby
@client.create_proxy
```

Creating new har
```ruby
port = "8081"

payload = {}

@client.create_proxy_har(port, payload)
```

Get current har log
```ruby
port = "8081"

@client.get_proxy_har(port)
```

Create page on har log
```ruby
port = "8081"

payload = {}

@client.create_proxy_page(port, payload)
```

Delete proxy port
```ruby
port = "8081"

@client.delete_proxy_port(port)
```

SDK Documentation is hosted at http://
---


