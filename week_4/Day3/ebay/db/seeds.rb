# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' , { name: 'Copenhagen' })
#   Mayor.create(name: 'Emanuel', city: cities.first)


#List of products:
list_users=[
	User.new(name: "Wilfredo", email_address: "wilfredo@gmail.com"),
	User.new(name: "Caridad", email_address: "cari@yahoo.com"),
	User.new(name: "Pedro", email_address: "pp@yahoo.com"),
	User.new(name: "Mirtica", email_address: "lalo@yahoo.com"),
]

list_products=[
	Product.new(title: "Bycicle",description: "New without garanty. The color is red",deadline: Time.now),
	Product.new(title: "Necklace",description: "Handmade with multiple colors and materials",deadline: Time.now),
    Product.new(title: "Movie's Posters",description: "Original posters of the top's movies.", deadline: Time.now),
    Product.new(title: "Vintage clock",description: "Grandma's clock", deadline: Time.now),
    Product.new(title: "Cashmere scarf",description: "Fine cashmere made by child laborors", deadline: Time.now),
]

user_products=[]

#Gives to every user a product. When users are finished, assign new products to the array again.
list_products.each_with_index do |product, i|
	user_i = i % list_users.length

	if user_products[user_i] == nil
		user_products[user_i] = []
	end

	user_products[user_i].push(product)  #1 product for 1 user
end

#To avoid duplication. Only save if element isn't on the list.Then I can apply rake db: seed whenever I want.

list_users.each_with_index do |user, i|
  # Check if list of users already exists
  if User.find_by(name: user.name) == nil
    # If it doesn't exist (nil), save it
    puts "Creating user: #{user.name}"
    user.save

    user_products[i].each do |product|
    	product.user = user
    	product.save
    end 
  end
end

