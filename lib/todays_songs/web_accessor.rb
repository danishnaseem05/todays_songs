require 'pry'
require 'selenium-webdriver'
require 'chromedriver-helper'

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
		Selenium::WebDriver::Chrome::Service.driver_path=("/mnt/d/danis/Documents/PERSONAL PROJECTS/todays_songs/bin/chromedriver.exe")
		driver  = Selenium::WebDriver.for :chrome
		driver.get "#{self.url}"
	end


end

