lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "todays_songs/version"

Gem::Specification.new do |spec|
  spec.name          = "todays_songs"
  spec.version       = TodaysSongs::VERSION
  spec.authors       = ["Danish Naseem"]
  spec.email         = ["danishnaseem05@gmail.com"]

  spec.summary       = %q{Delivering users with top new songs each day}
  spec.description   = %q{Uses nokogiri to scrape song data from two different websites, makes songs, displays them to the user, and asks which one they'd want to hear, which then open the song's webpage.}
  spec.homepage      = "https://github.com/danishnaseem05/todays_songs.git"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/danishnaseem05/todays_songs.git"
  #spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "selenium-webdriver"
  spec.add_development_dependency "chromedriver-helper"
end
