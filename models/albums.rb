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
  "INSERT INTO album_collections (artist, title, genre, collector_id) 
  VALUES ('#{@artist}', '#{@title}', '#{@genre}', #{@collector_id}) RETURNING *; "
  result = SqlRunner.run(sql)
  @id = result[0]['id'].to_i
end

def self.all
  sql = "SELECT * FROM album_collections;"
  albums = SqlRunner.run( sql )
  return albums.map { |hash| Album.new( hash )
  }
end

end
