class TodaysSongs::CLIEnvironment

	attr_accessor :songs

	def run
		self.songs = self.create_songs
		self.greets
		self.menu
		self.goodbye
	end

	def greets
		puts "\n"
		puts "Hi! and Welcome to Today's Songs!"
		self.display_songs
	end

	def menu
		input = nil
		while input!= 'exit' || input!= 'no'
			input = self.song_selection?
			if input == "list songs"
				self.display_songs 
			elsif input == 'exit'
				break
			else 
				self.play(input)
			end
		end
	end

	def incorrect_value
		puts "Invalid value. Try again."
	end

	def song_selection?
		puts "\n"
		puts "Enter the number of the song you'd like to hear, 'list songs' to list the songs again or 'exit' to exit out of the program."
		input = gets.strip.downcase
	end

	def play_more?
		puts "\n"
		puts "Any other song, you want to listen to? (yes or no)"
		input = gets.strip.downcase
		if input == "yes" || input == "y" || input == "no" || input == "n"
			return
		else
			self.incorrect_value
			self.play_more?
		end
	end

	def goodbye
		puts "\n"
		puts "Hope you have a wonderful day. Bye!"
		puts "\n"
	end

	def display_songs
		puts "\n"
		count = 0
		songs.each do |song|
			count +=1
			puts "#{count}. #{song.name} - by #{song.artist}"
		end
		#TodaysSongs::Song.reset_list_songs
	end

	def create_songs

		# - https://www.thecurrent.org/collection/song-of-the-day
		# - https://www.jazziz.com/category/song-of-the-day/
		# - https://www.randomlists.com/random-songs
		
		# passes above links to Scraper class, gets a list of hashes in return
		# The above is unfinished as Scraper class has not yet been built
		
		# The array is just a test - The real array will come from the Scraper class
		songs  = [
			{:name => "Song 1", :artist => "Artist 1", :url => "http://google.com"},
			{:name => "Song 2", :artist => "Artist 2", :url => "http://facebook.com"},
			{:name => "Song 3", :artist => "Artist 3", :url => "http://song3.com"},
			{:name => "Song 4", :artist => "Artist 4", :url => "http://song4.com"},
		]

		# passing list of hashes to the song class to initialize a new instance for each hash
		TodaysSongs::Song.create_from_array(songs)
		# getting all song instances
		TodaysSongs::Song.list_songs
		
	end

	def input_to_index(input)
		int = input.to_i
		int - 1
	end

	def play(input)
		index = input_to_index(input)
		if valid_value?(index)
			 url = self.songs[index].url
			 web_accessor = TodaysSongs::WebAccessor.new(url)
			 web_accessor.display_page
			#puts "Playing #{self.songs[index].name} - by #{self.songs[index].artist}!"
			self.play_more?
		else
			self.incorrect_value
		end
	end 

	def valid_value?(value)
		value.is_a?(Integer) && value.between?(0, (self.songs.size-1))
	end

end