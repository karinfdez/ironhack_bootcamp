require_relative("../lib/todo_list.rb")
require_relative("../lib/task.rb")

RSpec.describe "TodoList" do 
	let (:list) {TodoList.new}
	
	it "should return the array of tasks" do
		task1=Task.new("Do laundry")
		task2=Task.new("Sleep")
		list.addTask(task1)
		list.addTask(task2)
		expect(list.tasks).to eq([ task1, task2 ])
	end
	it "should remove the task with an specific id" do
		task1=Task.new("Do laundry")
		task2=Task.new("Sleep")
		list.addTask(task1)
		list.addTask(task2)
		id = list.tasks[1].id   #Removes task #2 on the array
		list.deleteTask(id)
		expect(list.tasks).to eq([task1])
	end
	it "should show the task at specific id" do
		task1=Task.new("Do laundry")
		task2=Task.new("Sleep")
		list.addTask(task1)
		list.addTask(task2)
		task=list.findTask(999)
		expect(task).to eq(nil)
	end
	
	it "should show the task at specific id" do
		task1=Task.new("Do laundry")
		task1.update_content!("Do laundry")
		task2=Task.new("Sleep")
		task2.update_content!("Sleep")
		list.addTask(task1)
		list.addTask(task2)
		task=list.sort_by_created
		expect(task).to eq([task2,task1])
	end


end

