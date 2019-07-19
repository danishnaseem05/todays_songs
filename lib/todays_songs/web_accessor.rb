require 'pry'
class TodaysSongs::WebAccessor

	@@all = []

	attr_reader :url

	def initialize(url)
		@url = url
		self.class.all << self
	end

	def self.all
		@@all
	end

	def display_page
	end


end
