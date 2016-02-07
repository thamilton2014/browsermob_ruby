#
# config.rb
# Browsermob
#

module Browsermob
	module Util
		class Config

			@props = {
				:endpoints => {
					:base_url			=> "",
					:proxy 				=> "/proxy",
					:har 				=> "/proxy/%s/har",
					:pageRef			=> "/proxy/%s/har/pageRef",
					:proxy_port	 		=> "/proxy/%s"
				}
			}

			class << self
	        	attr_accessor :props

	         	def configure 
	          		yield props if block_given?
	        	end

		        # Get a configuration property given a specified location, example usage: Config::get('auth.token_endpoint')
		        # @param [String] index - location of the property to obtain
		        # @return [String]
		        def get(index)
		          properties = index.split('.')
		          get_value(properties, props)
		        end

		        private

		        # Navigate through a config array looking for a particular index
		        # @param [Array] index The index sequence we are navigating down
		        # @param [Hash, String] value The portion of the config array to process
		        # @return [String]
		        def get_value(index, value)
		          index = index.is_a?(Array) ? index : [index]
		          key = index.shift.to_sym
		          value.is_a?(Hash) and value[key] and value[key].is_a?(Hash) ?
		          get_value(index, value[key]) :
		          value[key]
		        end

		    end # => End Self
		end # => End Config
	end # => End Util
end # => End Appkb