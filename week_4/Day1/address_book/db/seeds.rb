# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Contact.destroy_all

Contact.create(name: "Karin",
				address: "10 SW street",
				phone_number: "555-555-5555",
				email_address: "karin@gmail.com")

Contact.create(name: "Lola",
				address: "9 NW street",
				phone_number: "555-578-5555",
				email_address: "lola@gmail.com")

Contact.create(name: "Jason",
				address: "7 NW street",
				phone_number: "555-578-5445",
				email_address: "json@gmail.com")

Contact.create(name: "Nadia",
				address: "7 SW street",
				phone_number: "565-598-4445",
				email_address: "nadia@yahoo.com")

Contact.create(name: "Carlos",
				address: "19 SW street",
				phone_number: "665-598-3215",
				email_address: "csuarez@yahoo.com")