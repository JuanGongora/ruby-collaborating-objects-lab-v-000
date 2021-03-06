require 'pry'

class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    name = self
    @songs = []
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.find_or_create_by_name(name)
    artist = @@all.detect {|x| x.name == name}
    if artist == nil
      artist = Artist.new(name)
      artist.save
      artist
    else
      artist
    end
  end

  def print_songs
    @songs.select {|x| puts x.name}
  end

end
