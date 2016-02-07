#
# base_service.rb
# Browsermob
#

module Browsermob

	module Services

		class BaseService

			class << self

				protected

				def get_headers(content_type = "application/json")
					{
						:content_type 	=> content_type,
						:accept 		=> "application/json"
					}
				end

			end # => end self

		end # => end BaseService

	end # => end Services

end # => end Browsermob
