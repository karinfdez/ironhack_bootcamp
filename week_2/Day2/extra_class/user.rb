
require("github_api")

puts "What's your GitHub user name?"
username = gets.chomp

github = Github.new

user = github.users.get(:user => username)

puts "\nUser: #{user.login}"
puts "Your name is #{user.name}."
puts "You work for #{user.company}."
puts "You are located in #{user.location}."