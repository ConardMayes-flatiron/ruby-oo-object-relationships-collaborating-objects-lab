require "pry"
class Artist

    attr_accessor :name, :song

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end
    
    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end



    def self.find_or_create_by_name(given_name)
        # binding.pry
        if (@@all.find {|person| person.name == given_name}) != nil
            @@all.find {|person| person.name == given_name}
        else
            new_guy = Artist.new(given_name)
            new_guy
        end
    end

    def self.all
        @@all
    end

    def print_songs
        # binding.pry
        self.songs.each {|song| puts song.name}
    end



end