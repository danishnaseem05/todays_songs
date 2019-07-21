require 'open-uri'
require 'nokogiri'

class TodaysSongs::Scraper

    @@all = []

    def self.all
        @@all.flatten
    end

    def self.save(json)
        @@all << json
    end

    def self.create_from_thecurrent(url)
        # songs: html.css("article.row h2 a")
        # name: song.text.split(" - ")[1]
        # artist: song.text.split(" - ")[0]
        # url: song.attribute("href").value

        result = []
        html = Nokogiri::HTML(open(url))
        songs = html.css("article.row h2 a")

        songs.each do |song|
            result << {
            :name => song.text.split(" - ")[1],
            :artist => song.text.split(" - ")[0],
            :url => "https://www.thecurrent.org" + song.attribute("href").value}
        end
        self.save(result)       
    end

    def self.create_from_youtubetopmusic(url)
        # songs: html.css("h3") # range: [5] - [11]
        # name+artist: song[range].children.text.split(/[()-]/) #=> ["Marshmello & Kane Brown ", " One Thing Right ", "Official Music Video", " ", " Duration: 3:24."]
        # iterate through above return value, and strip each one, then create hash {:name, :artist}
        # url: "http://youtube.com" + song[range].children.css("a").attribute("href").value


        result = []
        html = Nokogiri::HTML(open(url))
        songs = html.css("h3")

        counter = 5
        while counter < 11 
            hash = self.name_and_artist(songs[counter].children.text.split(/[()-]/))

            url = "http://youtube.com" + songs[counter].children.css("a").attribute("href").value

            hash[:url] = url

            result << hash
            counter += 1
        end
        self.save(result)
    end

    def self.name_and_artist(array)
        stripped_arr = []
        array.each do |element|
            stripped_arr << element.strip
        end
        {:name => stripped_arr[1], :artist => stripped_arr[0]}
    end
    
end