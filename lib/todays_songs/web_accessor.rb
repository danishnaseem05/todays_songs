class TodaysSongs::WebAccessor

	@@all = []

	def initialize(url)
		@url = url
		self.class.all << self
	end

	def self.all
		@@all
	end


end