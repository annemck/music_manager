require_relative('../db_accessor.rb')
require_relative('artist.rb')


class Album
  
  attr_accessor :title, :genre, :artist_id
  attr_reader :id
  
  
  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end
  
  def save()
    sql = "INSERT INTO albums (title, genre, artist_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @genre, @artist_id]
    results = DataAccessor.run(sql, values)
    @id = results[0]["id"].to_i
  end
  
  def self.list_all()
    sql = "SELECT * FROM albums"
    results = DataAccessor.run(sql)
    return results.map { |album| Album.new(album) }
  end
  
  def show_artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    value = [@artist_id]
    result = DataAccessor.run(sql, value)[0]
    return Artist.new(result)
  end
  
  def update()
    sql = "UPDATE albums SET (title, genre, artist_id) = ($1, $2, $3) WHERE id = $4"
    values = [@title, @genre, @artist_id, @id]
    DataAccessor.run(sql, values)
  end
end
