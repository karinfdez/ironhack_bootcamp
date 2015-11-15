require "spec_helper"

describe "Viewing todo items" do
	let! (:todo_list){ TodoList.create(title: "Grocery list",description: "Groceries")}
	
	def view_todo_list(list)
		visit "/todo_lists"
		within "#todo_list_#{list.id}" do
			click_link "List Items"
		end
	end
	
	it "displays the title of the todo list" do
		view_todo_list(todo_list)
		within("h1") do
			expect(page).to have_content(todo_list.title)
		end
	end

	it "displays no items when a todo list is empty" do
		view_todo_list(todo_list)
		expect(page.all("ul.todo_items li").size).to eq(0)
	end

	it "displays items content when a todo list has items" do
		

		todo_list.todo_items.create(content: "Milk")
		todo_list.todo_items.create(content: "Egg")
		todo_list.todo_items.create(content: "Butter")

		#First I garantee that the items are created and then is ready to call the page.
		view_todo_list(todo_list)

		expect(page.all("ul.todo_items li").size).to eq(3)

		within "ul.todo_items" do
			expect(page).to have_content("Milk")
			expect(page).to have_content("Egg")
			expect(page).to have_content("Butter")
		end
	end
end