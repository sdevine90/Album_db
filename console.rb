require('pry-byebug')
require_relative('models/collectors')
require_relative('models/albums')

collector1 = Collector.new({
  "name"  =>  "Stephanie",
  })

album1 = Album.new({
  "artist"  =>  "The Eagles",
  "title" =>  "Take it Easy",
  "genre" =>  "Country",
  "collector_id"  => collector1.id
  })

collector1.save()

binding.pry
nil