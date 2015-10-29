require_relative ("../lib/todo_list.rb")  #Moving out 1 folder
require_relative("../lib/task.rb")
require("RSpec")

RSpec.describe "TodoList" do 
	let (:list) {TodoList.new("Karin")}
	
	it "should add the task to the array" do
		task1=Task.new("Do laundry")
		list.addTask(task1)
		expect(list.tasks).to eq([task1])

    end
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
	it "sort the tasks by last created" do
		task1=Task.new("Do laundry")
		task2=Task.new("Sleep")
		task1.update_content!("Do laundry")   #Add time to taks
		task2.update_content!("Sleep")
		list.addTask(task1)
		list.addTask(task2)
		order_list=list.sort_by_created
		expect(order_list).to eq([task2,task1])
	end

	it "should show the task at specific id" do
		task1=Task.new("Do laundry")
		task2=Task.new("Sleep")
		list.addTask(task1)
		list.addTask(task2)
		task=list.findTask(999)
		expect(task).to eq(nil)
	end
	
end

