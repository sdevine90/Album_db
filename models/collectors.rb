require('pg')
require_relative('../db/sql_runner')
require_relative('songs')
require_relative('albums')

class Collector

  attr_accessor  :name
  attr_reader :id

  def initialize( options )
    @name = options[ 'name' ]
    @id = options['id'].to_i if options['id']
  end

  def save
    sql =
    "INSERT INTO collectors
    (name)
    VALUES
    ('#{@name}') RETURNING *;
    "
    result = SqlRunner.run( sql )
    @id = result[0]['id'].to_i
  end


  def albums() #grabbing from albums
    sql = "SELECT * FROM albums WHERE collectors_id = #{@id}"
    result = SqlRunnere.run(sql)
    return result.map { |album| Album.new(album)}
  end


  def self.all()
    sql = "SELECT * FROM collectors;"
    collectors = SqlRunner.run(sql)
    return collectors.map { |collectors| Collector.new(collectors)} #singular Collector.new cause class is singular
  end

  def self.delete_all
    sql = "DELETE FROM collectors;"
    SqlRunner.run(sql)
  end

end