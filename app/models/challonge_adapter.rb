require 'ostruct'
require 'securerandom'

#https://api.challonge.com/v1/tournaments.json/?api_key=hn1jLWtDsTypCdusMxMus5U5sXaW8YMELn7FaU5l&tournament[name]=1v1%20Air%20Tournaments&tournament[url]=adc1gf23a
class ChallongeAdapter
	include HTTParty
	attr_accessor :name, :url, :key

	base_uri 'https://api.challonge.com/v1'

	INVALID_TITLE = 'No such game exists! Please try again!'
	INVALID_ID = 'No such console exists!'

	def initialize name, url
		@key = "hn1jLWtDsTypCdusMxMus5U5sXaW8YMELn7FaU5l"
		@name = URI.escape name
		@url = url
	end

	def create_tournament
		self.class.post "/#{get_type}/?#{get_ids}&#{get_name}&#{get_url}"
	end

	def add_participant(username)
		self.class.post "/tournaments/#{@url}/participants.json?#{get_ids}&participant[name]=#{username}"
	end

	def start_tournament
		self.class.post "/tournaments/#{@url}/start.json?#{get_ids}"
	end

	private

	def get_name
		"tournament[name]=#{@name}"
	end

	def get_ids
		"api_key=#{@key}"
	end

	def get_type
		'tournaments.json'
	end

	def get_url
		"tournament[url]=#{@url}"
	end

end
