require('pg')
require_relative('../db/sql_runner')

class Album
  attr_reader :artist, :title, :genre, :id, :collector_id

  def initialize(options)
    @artist = options['artist']
    @title = options['title']
    @genre = options['genre']
    @id = options['id'].to_i if options['id']
    @collector_id = options['collector_id'].to_i
  end

  def save
    sql =
    "INSERT INTO albums (artist, title, genre, collector_id) 
  VALUES ('#{@artist}', '#{@title}', '#{@genre}', #{@collector_id}) RETURNING *; " #insert into albums is referring to the table within the album collection.sql file
  result = SqlRunner.run(sql)
  @id = result[0]['id'].to_i
end

def self.all
  sql = "SELECT * FROM albums;" #select is coming from the album_collection.sql file table albums. * you can replace star with artist, title, etc... and that will hand back it specifically
  albums = SqlRunner.run( sql )
  return albums.map { |hash| Album.new( hash ) #album.new is coming from the console.rb file
  }
end

def self.delete_all
  sql = "DELETE FROM albums;"
  SqlRunner.run(sql)
end
end
