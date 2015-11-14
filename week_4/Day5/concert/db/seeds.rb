# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  concerts=[
  	Concertnet.new(artist: "Wilfredo", venue: "american_arena", city: "Miami", date: Time.now, price: 50.25,description: "Best concert ever"),
  	Concertnet.new(artist: "KK", venue: "nina", city: "Chicago", date: Time.now, price: 100,description: "So expensive"),
  	
  ]

  

  concerts.each do |concert|
    # Check if list of users already exists
    if Concertnet.find_by(artist: concert.artist) == nil
      # If it doesn't exist (nil), save it
      puts "Creating concert: #{concert.artist}"
      concert.save
     end
     
    end

