require_relative('../db_accessor.rb')
require_relative('album.rb')


class Artist
  
  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options['name']
  end
  
  
end
