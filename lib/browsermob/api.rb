#
# api.rb
# Browsermob
#

module Browsermob

	class API

		def initialize

		end

		def get_proxy_list
			Services::ProxyService.proxy
		end

		def create_proxy(payload = {})
			Services::ProxyService.create_proxy(payload)
		end

		def create_proxy_har(port, payload = {})
			Services::ProxyService.create_proxy_har(port, payload)
		end

		def get_proxy_har(port)
			Services::ProxyService.get_proxy_har(port)
		end

		def create_proxy_page(port, payload = {})
			Services::ProxyService.create_proxy_page(port, payload)
		end

		def delete_proxy_port(port = "")
			Services::ProxyService.delete_proxy_port(port)
		end

	end # => end API

end # => end Browsermob