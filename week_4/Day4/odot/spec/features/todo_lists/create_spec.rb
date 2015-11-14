require 'spec_helper'
describe "Creating todo lists" do 
	it "redirects to the todo list index page on success" do
		visit "/todo_lists"  #Testing that the url to the todo list is working
		click_link "New Todo list"
		expect(page).to have_content("New Todo List")  #When press the link show me the page that
														#says "New Todo List"
	    #To test that the form works:
	    fill_in "Title", with:"My todo list"
	    fill_in "Description", with:"This is what I'm doing today"
	    click_button "Create Todo list"  #This is the button name

	    #When the form is fill and the button is click:
	    expect(page).to have_content("My todo list")  #The same title that I fill on top.
	end

	
	it "displays an error when the todo list has no title" do
		#Expect that database is clear after each test
		expect(TodoList.count).to eq(0) 

		#testing the same as before but with title empty
		visit "/todo_lists"  #Testing that the url to the todo list is working
		click_link "New Todo list"
		expect(page).to have_content("New Todo List")  #When press the link show me the page that
														#says "New Todo List"
	    #To test that the form works:
	    fill_in "Title", with:""
	    fill_in "Description", with:"This is what I'm doing today"
	    click_button "Create Todo list"  #This is the button name

	    expect(page).to have_content("error")
	   	expect(TodoList.count).to eq(0)  #To make sure again database is in blank.

	   	visit "/todo_lists" 
	   	#To make sure is not saving the content of description.
	   	expect(page).to_not have_content("This is what I'm doing today")

	end

	it "displays an error when the todo list has a title with less than 3 characters" do
		#Expect that database is clear after each test
		expect(TodoList.count).to eq(0) 

		#testing the same as before but with title empty
		visit "/todo_lists"  #Testing that the url to the todo list is working
		click_link "New Todo list"
		expect(page).to have_content("New Todo List")  #When press the link show me the page that
														#says "New Todo List"
	    #To test that the form works:
	    fill_in "Title", with:"ab"
	    fill_in "Description", with:"This is what I'm doing today"
	    click_button "Create Todo list"  #This is the button name

	    expect(page).to have_content("error")
	   	expect(TodoList.count).to eq(0)  #To make sure again database is in blank.

	   	visit "/todo_lists" 
	   	#To make sure is not saving the content of description.
	   	expect(page).to_not have_content("This is what I'm doing today")

	end
end
