require 'bundler'
Bundler.require

require_relative '../lib/dog'

DB = {:conn => SQLite3::Database.new("db/dogs.db")}

Dog.create_table 

teddy = Dog.find_or_create_by(name: "Teddy", breed: "Cockapoo")
bingo = Dog.find_or_create_by(name: "Bingo", breed: "Collie")

# Creates a new instance and duplicates
#Dog.create(name: "Ralph", breed: "Lab")

p bingo.name 
#=> Bingo
p bingo.breed
#=> Collie

p Dog.find_by_name("Bingo")
#=> #<Dog:0x00007ffff863e520 @id=1, @name="Bingo", @breed="Collie">

bingo.name = "Banjo"
bingo.update
p bingo.name
#=> Banjo

teddy.name = "Teddy Jr."
teddy.save
p teddy.name
#=> Teddy Jr. 

p Dog.all
#=> [#<Dog:0x00007fffbc602fc0 @id=1, @name="Bingo", @breed="Collie">, #<Dog:0x00007fffbc602f20 @id=2, @name="Teddy", @breed="Cockapoo">, #<Dog:0x00007fffbc602e08 @id=3, @name="Ralph", @breed="Lab">, #<Dog:0x00007fffbc602cf0 @id=4, @name="Ralph", @breed="Lab">]