require 'pry'
class Song
  attr_accessor :song, :name, :artist_name
  @@all = []

  def initialize(name = "chonk")
    @name = name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create()
    song = Song.new()        
    @@all << song
    return song
  end

  def self.new_by_name(name)
      Song.new(name)
  end

  def self.create_by_name(name)
    song = Song.new(name)
    @@all << song
    return song
  end

  def self.find_by_name(name)
    Song.all.find {|songs| songs.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical()
    self.all.sort do |a, b|
      a.name <=> b.name
    end 
  end

  def self.new_from_filename(name)
    artist_name = name.match(/(.*) - (.*)\.mp3/)[1]
    song_name = name.match(/(.*) - (.*)\.mp3/)[2]
    song = Song.new(song_name)
    song.artist_name = artist_name
    return song
  end

  def self.create_from_filename(name)
    song = self.new_from_filename(name)
    @@all << song
    return song 
  end

  def self.destroy_all()
    @@all.clear()
  end
  #binding.pry
end
