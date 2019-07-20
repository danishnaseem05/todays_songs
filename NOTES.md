# Usage

***Title:** Today's Songs*
<br>
***Author:** Danish Naseem*
<br>
***Language:** Ruby*
<br>
***Version:** 0.1.0*

- Start with the User Interactive Environment
- `./bin/todays_songs`: Runs the program
- `CLI Environment Class`: User Interface Controller
- `Scraper Class`: Scrapes html elements from links and returns them in a json format datatype
- `Song Class`: creates song objects from json format datatype
- `Web Accessor Class`: opens webpage from given url

Project's about Songs of the Day

from following links:

- <https://www.thecurrent.org/collection/song-of-the-day>
- <https://www.jazziz.com/category/song-of-the-day/>
- <https://www.randomlists.com/random-songs>

program starts when user types in ./bin/todays_songs in the terminal [for now]

## CLI

- calls CLI Environment class
- the CLI file is bin/today's_songs

## CLI Environment class

- `#greets`: the user; tells them about the program, and the controls of how to see all of today's songs, and typing exit anytime
  would exit the program.
- `#run`: heart of the entire program. calls #greets, then runs in a loop, and exits if user inputs exit, which then it calls #goodbye. Inside the loop, calls #create_songs, according to the user inputs
- `#goodbye`:  prints goodbye message, then exits out of the program
- `#create_songs`: uses the upper two mentioned links,
  passes them to the Scrapper class, then gets a list of hashes in return, passes list of hashes to the song class, which iterates and creates song instances through them and storing all the instances within the class. Then calls .list_songs class method from the song class, which returns an array of song instances.
- `#display_songs`: calls #create_songs to get that array of song instances and displays each instances to the user as follows

```
1. [Song_name] - by [Artist_name]
2. [Song_name] - by [Artist_name]
3. [Song_name] - by [Artist_name]
.
.
.
```

- ask which song they'd like to hear, and to enter their response as a number
- `#play`: accepts and converts their response to an int.
  convert the int to an index, and get the song instance from #list_songs array using that index, gets #url of that song instance and passes that to the Web Accessor class, which opens the song link to the webpage.
- `#play_more?`: asks user if they would like to access any other songs
- if yes, list the songs again, and ask which one
- if no, ask to exit enter exit then run #goodbye

## Web Accessor Class

- @@all class array keeps track of all the links it opened by saving all instances as the class initializes.
- `#initialize`: takes in a url, and stores it in a instance variable @url, that can be accessed through an attribute reader.
- `#display_page`: calls @url variable using its attribute reader, then opens the web page using that url

## Song Class

- @@all class array keeps track of all the songs it creates, by saving all instances as the class initializes.
- `.list_songs`: return @@all array containing all of song class's instances.
- `.create_from_array`: takes in array of hashes, iterates through it, and makes new song instance for each hash by calling #initialize on song class as by simply doing Module::Song.new(name, artist, url).
- `#initialize`: iterates through them, and uses #send method to initialize new instance with name, optional artist set to nil by default, and url Calls #artist= on that artist.
- `#artist=`: takes in a artist, and sets it to @artist = artist, if not already set, then calls that artist's #add_songs method.
- `#save`: adds each instance to @@all array
- `.reset_list_songs`: resets @@all array to empty

## Scraper Class

- TODO: *add some methods*
