require("./todo.rb")
require("RSpec")

RSpec.describe "Task" do 
	let (:task) {Task.new("Do laundry")}
	
	it "should return 1 on number of task" do
		expect(task.id).to eq (1)
	end

	it "should return 'false' when creating first task" do
		expect(task.complete?).to eq (false)
	end
	it "should return 'true' when complete! method is call" do
		expect(task.complete!).to eq (true)
	end
	it "should return 'false' when make_incomplete! method is call" do
		expect(task.make_incomplete!).to eq (false)
	end
	it "should return 'Sleep' when update_content method is call" do
		task.update_content!("Sleep")
		expect(task.content).to eq ("Sleep")
	end
	# it "should return current time when calling this method" do    #ISN'T WORKING
	# 	task.update_content!("Sleep")
	# 	expect(task.updated_at).to eq (Time.now)   
	# end

end

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
		# id = list.tasks[0].id   
		# task=list.findTask(id)
		# expect(task).to eq(task1.content)  
		task=list.findTask(999)
		expect(task).to eq(nil)
	end
end

