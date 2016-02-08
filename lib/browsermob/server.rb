#
# server.rb
# Browsermob
#

module Browsermob

	#
	# Wraps the Browsermob jar file
	#
	# Usage: 
	#
	#   server = Browsermob::Server.new("/path/to/jar")
	# 	server.start
	#
	# Automatically download the given version:
	#
	# 	server = Browsermob::Server.get("version")
	# 	server.start
	#
	# or the latest version:
	# 
	# 	server = Browsermob::Server.get(:latest)
	# 	server.start
	#
	# Run the server in the background:
	#
	# 	server = Browsermob::Server.new(jar, :background => true)
	# 	server.start
	#
	# Add additional arguments:
	#
	# 	server = Browsermob::Server.new(jar)
	# 	server << ["--additional", "args"]
	# 	server.start
	#

	class Server
		class Error < StandardError; end

		#
		# @params [String] version =
		# @params [Hash] opts = 
		def self.get(version, opts = {})
			new(download(version), opts)
		end

		def self.download(version)
			download_file_name = "#{version}.zip"

			if File.exists? download_file_name
				return download_file_name
			end

			begin
        		response = RestClient.get("https://github.com/lightbody/browsermob-proxy/releases/download/browsermob-proxy-2.1.0-beta-4/#{download_file_name}")
          		File.write(download_file_name, response.to_s)
          		
          		tempdir = Selenium::WebDriver::Zipper.unzip(download_file_name)
          		FileUtils.mv(tempdir, './')

	      	rescue
	        	FileUtils.rm download_file_name if File.exists? download_file_name
	        	raise
	      	end

	      	download_file_name

		end

		#
		# The server url
		#
		attr_reader :url

		#
		# The server port
		#
		attr_accessor :port

		#
		# The proxy port created
		#
		attr_accessor :proxy_port

		#
		# Whether to launch the server in the background
		#
		attr_accessor :background

		#
		# Path to log file, or "true" for stdout
		#
		attr_accessor :log

		def initialize(jar, opts = {})
			@jar 			= jar
			@host	 		= "127.0.0.1"
			@port 			= opts.fetch(:port, 8080)
			@background 	= opts.fetch(:background, false)
			@log 			= opts[:log]

			@url 			= "#{@host}:#{@port}"
			@api_client 	= Browsermob::API.new

			@additional_args = []
		end

		def start
			process.start

			Browsermob::Util::Config.configure do |config|
				config[:endpoints][:base_url] = @url
			end
			# poll_for_service

			process.wait unless @background
		end

		def stop
			begin
				# Net::HTTP.get(@host, "/")
			rescue Errno::ECONNREFUSED

			end
			stop_process if @process
			# poll_for_shutdown

			@log_file.close if @log_file
		end

		def browsermob_url
			"http://#{@host}:#{@port}/proxy"
		end

		def get_proxy_list
			@api_client.get_proxy_list
		end

		def create_proxy(payload)
			@api_client.create_proxy(payload)
		end

		def create_proxy_har(port, payload)
			@api_client.create_proxy_har(port, payload)
		end

		def get_proxy_har(port, output_path)
			@api_client.get_proxy_har(port, output_path)
		end

		def create_proxy_page(port, payload)
			@api_client.create_proxy_page(port, payload)
		end

		def delete_proxy_port(port)
			@api_client.delete_proxy_port(port)
		end

		private

		def stop_process
			return unless @process.alive?

			begin
				@process.poll_for_exit(5)
			rescue ChildProcess::TimeoutError
				@process.stop
			rescue Errno::ECHILD
				# already dead
			ensure
				@process = nil
			end

		end

		def process
			@process ||= (
				cp = ChildProcess.build("java", "-jar", @jar, "--port", @port.to_s)
				io = cp.io

				if @log.kind_of?(String)
					@log_file = File.open(@log, "w")
					io.stdout = io.stderr = @log_file
				elsif @log
					io.inherit!
				end

				cp.detach = @background

				cp
			)
		end

		def poll_for_service
			unless socket.connected?
 				raise Error, "remote server not launched in #{@timeout} seconds"
 			end
		end

		def poll_for_shutdown
			unless socket.closed?
 				raise Error, "remote server not stopped in #{@timeout} seconds"
 			end
		end

		def socket
			# @socket ||= 
		end

	end # => 

end # => 