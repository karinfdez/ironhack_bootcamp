require 'spec_helper'
describe "Creating todo lists" do 
	it "Redirects to the todo list index page on success" do
		visit "/todo_lists"  #Testing that the url to the todo list is working
	end
end
