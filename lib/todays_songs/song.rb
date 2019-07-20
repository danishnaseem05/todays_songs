class TodaysSongs::Song

    @@all = []
    attr_accessor :name, :url
    attr_reader :artist

    def initialize(song_hash)
        song_hash.each do |key, value|
            self.send("#{key}=", value)
        end
     
       self.save
    end

    def self.create_from_array(songs)
        songs.each do |song_hash|
            song = TodaysSongs::Song.new(song_hash)
        end
    end

    def save
        self.class.list_songs << self
    end

    def self.reset_list_songs
        self.list_songs.clear
    end

    def self.list_songs
        @@all
    end

    def artist=(artist_name)
        if self.artist!=artist
            @artist = artist
        end
    end

end