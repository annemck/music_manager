require_relative('../db_accessor.rb')
require_relative('album.rb')
require('pry-byebug')


class Artist
  
  attr_accessor :name
  attr_reader :id
  
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end
  
  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id"
    value = [@name]
    @id = DataAccessor.run(sql, value)[0]['id'].to_i
  end
  
  def self.list_all()
    sql = "SELECT * FROM artists"
    results = DataAccessor.run(sql)
    return results.map { |artist| Artist.new(artist) }
  end
  
  def list_albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    value = [@id]
    results = DataAccessor.run(sql, value)
    return results.map { |album| Album.new(album) }
  end
  
  def update()
    sql = "UPDATE artists SET name = $1 WHERE id = $2"
    values = [@name, @id]
    DataAccessor.run(sql, values)
  end
  
  def delete
    sql = "DELETE FROM artists WHERE id = $1"
    value = [@id]
    DataAccessor.run(sql, value)
  end
  
  def self.find_by_id(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    value = [id]
    result = DataAccessor.run(sql, value)[0]
    return Artist.new(result)
  end
  
end
