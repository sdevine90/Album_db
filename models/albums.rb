require('pg')
require_relative('../db/sql_runner')

class Album
attr_reader :artist, :title, :genre, :collector_id

def initialize(options)
  @artist = options['artist']
  @title = options['title']
  @genre = options['genre']
  @id = options['id'].to_i if options['id']
  @collector_id = options['collector_id'].to_i
end


end
