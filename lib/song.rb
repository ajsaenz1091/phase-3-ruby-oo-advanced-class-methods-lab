require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find{|song| name == song.name }
  end

  def self.find_or_create_by_name(name)
    # if self.find_by_name(name)
    #   self.find_by_name(name)
    # else
    #   self.create_by_name(name)
    # end
    # self
    self.find_by_name(name) || self.create_by_name(name) #If the first one doesn't return the song, then execute the right side
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file_name)
    split_file = file_name.gsub(".mp3", "").split(" - ")
    song = self.new
    song.name = split_file[1]
    song.artist_name = split_file[0]
    song
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save
  end

  def self.destroy_all
    @@all.clear
  end
end
