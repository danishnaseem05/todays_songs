require 'pry'
class TodaysSongs::Song

    @@all = []
    attr_reader name, artist, url

    def initialize(name, artist=nil, url)
        @name = name
        self.artist = artist
        @url = url

        self.class.all << self
    end

    def self.create_from_array(array)

    end

    def self.all
        @@all
    end

    def artist=(artist)
        if self.artist!=artist
            @artist = artist
            artist.add_songs
        end
    end

end