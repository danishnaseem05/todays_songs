title: Today's Songs
author: Danish Naseem
language: Ruby
version: 0.1.0


- Start with the User Interactive Environment
- CLI portion in the bin directory
- Number of Classes
- A Scraper Class
- Song class
- Artist class
- Web Accessor Class
- A CLI Environment Class
- Tests for each class in spec directory


Project's about Songs of the Day

from follwoing links:
- https://www.thecurrent.org/collection/song-of-the-day
- https://songoftheday.co/

program starts when user types in today's_songs

CLI:
- calls CLI Environment class
- the CLI file is bin/today's_songs

CLI Environment class:
- #greets: the user; tells them about the program, and the controls of how to see all of today's songs, and typing exit anytime would exit the program.
- #run: heart of the entire program. calls #greets, then runs in a loop, and exits if user inputs exit, which then it calls #goodbye. Inside the loop, calls #create_songs, according to the user inputs
- #goodbye:  prints goodbye message, then exits out of the program
- #creates_songs: uses the upper two mentioned links, passes them to the Scrapper class, then gets a list of hashes in return, passes list of hashes to the song class, which iterates and creates song instances through them and storing all the instances within the class
- list songs; shows them a list of songs in using the #list_songs method in the song class, which returns an array, then pass the array to the #display_songs in CLI Environment class, which displays the songs as following
	
1. [Song_name] - by [Artist_name]
2. [Song_name] - by [Artist_name]
3. [Song_name] - by [Artist_name]
	       -
	       -
	       -
	      etc

- ask which song they'd like to hear, and to enter their response as a number
- accept and convert their response to an int.
- Convert the int to an index, and get the song instance from #list_songs array using that index, gets #url of that song instance and passes that to the Web Accessor class, which opens the song link to the webpage.
- asks user if they would like to access any other songs
- if yes, list the songs again, and ask which one
- if no, ask to exit enter exit then run #goodbye

Web Accessor Class:
- @@all class array keeps track of all the links it opened, by saving all instances as the class initializes.
- #initialize - takes in a url, and stores it in a instance variable @url, that can be accessed through an attribute reader.
- #display_page - calls @url variable using its attribute reader, then opens the web page using that url


Song class:
- @@all class array keeps track of all the songs it creates, by saving all instances as the class initializes.
- #initialize: initializes with name, and optional artist set to nil by default. calls #artist= on that artist.
- #artist= :takes in a artist, and sets it to @artist = artist, if not already set, then calls that artist's #add_songs method. 


Artist Class:
- @@all class array keeps track of all the artists it creates, by saving all instances as the class initializes.
- #initialize: initalilizes with empty @songs array, #name
- #add_songs: adds songs to the @songs array using its attribute accessor, if the song is not already present, and sets that song's artist to self, if that song's artist is nil.
