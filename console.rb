require('pry-byebug')
require_relative('models/collectors')

collector1 = Collector.new({
  "name"  =>  "Stephanie",
  })

collector1.save()

binding.pry
nil