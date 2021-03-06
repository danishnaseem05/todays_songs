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
		while input!= 'exit'
			input = self.song_selection?
			if input == "list songs"
				self.display_songs 
			elsif input == 'exit'
				break
			else 
				condition = self.play(input)
				if condition == "no" || condition == "n"
					break
				end
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
			return input
		else
			self.incorrect_value
			self.play_more?
		end
	end

	def goodbye
		puts "\n"
		puts "See you again tomorrow. Bye!"
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
		
		# passes links to Scraper class, get a list of hashes in return
		
		TodaysSongs::Scraper.create_from_thecurrent("https://www.thecurrent.org/collection/song-of-the-day/")

		TodaysSongs::Scraper.create_from_youtubetopmusic("https://www.youtube.com/feed/trending?bp=4gIuCggvbS8wNHJsZhIiUExGZ3F1TG5MNTlhbVBud2pLbmNhZUp3MDYzZlU1M3Q0cA%3D%3D")

		songs = TodaysSongs::Scraper.all
		
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