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
            :url => song.attribute("href").value}
        end
        self.save(result)    
        binding.pry    
    end

    def self.create_from_jazziz(url)
        result = []
        html = Nokogiri::HTML(open(url))
        binding.pry


        self.save(result)
    end

    def self.create_from_randomlists(url)
        result = []
        html = Nokogiri::HTML(open(url))


        self.save(result)
    end

end