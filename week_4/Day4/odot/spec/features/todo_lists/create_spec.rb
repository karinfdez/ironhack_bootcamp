require 'spec_helper'

describe "Creating todo lists" do 

	def create_todo_list(options={})
		options[:title] ||="My todo list"    #When calling the metgod without infp on the hashes takes this by default/
		options[:description] ||="My todo list"

		#testing the same as before but with title empty
		visit "/todo_lists"  #Testing that the url to the todo list is working
		click_link "New Todo list"
		expect(page).to have_content("New Todo List")  #When press the link show me the page that
														#says "New Todo List"
		#To test that the form works:
	    fill_in "Title", with: options[:title]
	    fill_in "Description", with: options[:description]
	    click_button "Create Todo list"  #This is the button name
	end
	

	it "redirects to the todo list index page on success" do
		create_todo_list
	    #When the form is fill and the button is click:
	    expect(page).to have_content("My todo list")  #The same title that I fill on top.
	end

	
	it "displays an error when the todo list has no title" do
		#Expect that database is clear after each test
		expect(TodoList.count).to eq(0) 

		create_todo_list(title: "") #Now testing with empty title
	   
	    expect(page).to have_content("error")
	   	expect(TodoList.count).to eq(0)  #To make sure again database is in blank.

	   	visit "/todo_lists" 
	   	#To make sure is not saving the content of description.
	   	expect(page).to_not have_content("This is what I'm doing today")

	end

	it "displays an error when the todo list has a title with less than 3 characters" do
		#Expect that database is clear after each test
		expect(TodoList.count).to eq(0) 

		#testing the same as before but with title with less thab 3 characters
		create_todo_list(title: "ab")

	    expect(page).to have_content("error")
	   	expect(TodoList.count).to eq(0)  #To make sure again database is in blank.

	   	visit "/todo_lists" 
	   	#To make sure is not saving the content of description.
	   	expect(page).to_not have_content("This is what I'm doing today")

	end

	it "displays an error when the todo list has no description" do
		#Expect that database is clear after each test
		expect(TodoList.count).to eq(0) 
		#Testing with description empty.
		create_todo_list(description: "")
	    
	    #To test that the form works:

	    expect(page).to have_content("error")
	   	expect(TodoList.count).to eq(0)  #To make sure again database is in blank.

	   	visit "/todo_lists" 
	   	#To make sure is not saving the content of  title and empty description.
	   	expect(page).to_not have_content("My todo list")

	end

	it "displays an error when the todo list has a description with less than 3 characters" do
		#Expect that database is clear after each test
		expect(TodoList.count).to eq(0) 
		create_todo_list(description: "No")
	  
	    expect(page).to have_content("error")
	   	expect(TodoList.count).to eq(0)  #To make sure again database is in blank.

	   	visit "/todo_lists" 
	   	#To make sure is not saving the content of description.
	   	expect(page).to_not have_content("My todo list")

	end
end
