require('pg')
require_relative('../db/sql_runner')
require_relative('albums')

class Song

  attr_reader :song_title, :id, :album_id 

  def initialize(options)
    @song_title = options['song_title']
    @id = options['id'].to_i if options['id']
    @album_id = options['album_id'].to_i
  end

  def save
    sql =
    "INSERT INTO songs
    (song_title, album_id)
    VALUES
    ('#{@song_title}', #{@album_id}) RETURNING id;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM songs;"
    SqlRunner.run(sql)
  end

end

