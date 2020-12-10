require "pry"
class Song
    attr_accessor :name, :artist
    
    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def save
        @@all << self
    end


    def self.all
        @@all
    end

    def self.new_by_filename(file)
        song_artist_array = file.split(" - ")
        # binding.pry
        #song = Song.new(song_artist_array[1])
        #song.artist=song_artist_array[0]
        new_song = self.new(song_artist_array[1])
        new_song.artist = Artist.find_or_create_by_name(song_artist_array[0])
        new_song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end


end