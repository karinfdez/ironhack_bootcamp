# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

new_projects = [
  Project.new(name: "Ironhack", description: "The best coding school."),
  Project.new(name: "Wendy's", description: "Okay burgers. Extremely unhealthy."),
  Project.new(name: "Toasted", description: "Website for toasted."),
  Project.new(name: "Building.co", description: "Events with Building.co."),
  Project.new(name: "Karin", description: "What can I say about me?"),
  Project.new(name: "Lola", description: "Possible name."),
  Project.new(name: "Ironhack", description: "Here in Miami"),
  Project.new(name: "Ironhack", description: "Here in Miami"),
  Project.new(name: "Filling_info", description: "This is so boring!!!"),
  Project.new(name: "Jazz", description: "what makes me dream"),
  Project.new(name: "Cuba", description: "where my seeds are.."),
  Project.new(name: "Miami", description: "Where my future and dreams are.Do I belong here?"),
  Project.new(name: "Family", description: "They show me the first things."),
  Project.new(name: "Me", description: "The one that decides who want to be..."),
  Project.new(name: "Love", description: "So hard to explain sometimes..."),
]

#To avoid duplication. Only save if element isn't on the list.Then I can apply rake db: seed whenever I want.
new_projects.each do |proj|
  # Check if project already exists
  if Project.find_by(name: proj.name) == nil
    # If it doesn't exist (nil), save it
    puts "Creating Project: #{proj.name}"
    proj.save

    proj.entries.create(hours: 3,minutes: 47)  #Create the same entry for each project with different id's
    # entr=proj.entries.create(hours: 4,minutes: 43)
    proj.entries.create(hours: 2,minutes: 50)
    proj.entries.create(hours: 3,minutes: 45)
  end


end

puts "Seeds end!"