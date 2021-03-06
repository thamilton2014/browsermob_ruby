#
# proxy_service.rb
# Browsermob
#

module Browsermob

	module Services

		class ProxyService < Services::BaseService

			class << self

				def get_proxy_list
					url = Util::Config.get("endpoints.base_url") + Util::Config.get("endpoints.proxy")
					RestClient.get(url)
				end

				def create_proxy(payload)
					url = Util::Config.get("endpoints.base_url") + Util::Config.get("endpoints.proxy")
					RestClient.post(url, payload)
				end

				def create_proxy_har(port, payload)
					url = Util::Config.get("endpoints.base_url") + sprintf(Util::Config.get("endpoints.har"), port)
					RestClient.put(url, payload)
				end

				def get_proxy_har(port)
					url = Util::Config.get("endpoints.base_url") + sprintf(Util::Config.get("endpoints.har"), port)
					RestClient.get(url)
				end

				def create_proxy_page(port, payload)
					url = Util::Config.get("endpoints.base_url") + sprintf(Util::Config.get("endpoints.pageRef"), port)
					RestClient.put(url, payload)
				end

				def delete_proxy_port(port)
					url = Util::Config.get("endpoints.base_url") + sprintf(Util::Config.get("endpoints.proxy_port"), port)
					RestClient.delete(url)
				end

			end # => end self

		end # => end ProxyService

	end # => end Service

end # => end Browsermob
