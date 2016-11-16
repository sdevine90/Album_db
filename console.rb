require('pry-byebug')
require_relative('models/albums')
require_relative('models/collectors')


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

binding.pry
nil