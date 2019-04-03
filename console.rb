require_relative('model/artist.rb')
require_relative('model/album.rb')


artist1 = Artist.new( {'name' => 'Frank Sinatra'} )
  
artist1.save()
  
  album1 = Album.new( {
    'title' => 'My Way',
    'genre' => 'Scat',
    'artist_id' => "#{artist1.id}"
    })
    
album1.save()


artist2 = Artist.new( {'name' => 'Linkin Park'} )

artist2.save()

album2 = Album.new( {
  'title' => 'Meteora',
  'genre' => 'Alternative',
  'artist_id' => "#{artist2.id}"
  })
  
album2.save()

album3 = Album.new( {
  'title' => 'Hybrid Theory',
  'genre' => 'Alternative',
  'artist_id' => "#{artist2.id}"
  })
  
album3.save()

artist2.name = 'Lincoln Park'
artist2.update()

album3.title = 'HybridTheory Remixed'
album3.update()
  
binding.pry
  
nil
