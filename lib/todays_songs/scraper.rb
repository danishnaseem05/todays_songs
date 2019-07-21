require 'open-uri'
require 'nokogiri'

class TodaysSongs::Scraper

    @@all = []

    def self.all
        @@all
    end

    def self.save(json)
        self.all << json
    end

    def self.create_from_thecurrent(url)
        result = []

        # TODO: write some code

        self.save(result)        
    end

    def self.create_from_jazziz(url)
        result = []

        # TODO: write some code

        self.save(result)
    end

    def self.create_from_randomlists(url)
        result = []

        # TODO: write some code

        self.save(result)
    end

end