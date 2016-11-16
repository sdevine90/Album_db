require('pry-byebug')
require_relative('models/songs')
require_relative('models/albums')
require_relative('models/collectors')


Song.delete_all
Album.delete_all
Collector.delete_all

collector1 = Collector.new({
  "name"  =>  "Stephanie",
  })

collector1.save() #remember the order of the saves and deletes

album1 = Album.new({
  "artist"  =>  "The Eagles",
  "title" =>  "Take it Easy",
  "genre" =>  "Country",
  "collector_id"  => collector1.id
  })

album1.save()   #remember the order of the save

song1 = Song.new({
  "song" => "Lying Eyes",
  "album_id" => album1.id
  })

song1.save()

binding.pry
nil
