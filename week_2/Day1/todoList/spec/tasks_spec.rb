# require_relative ("../lib/todo_list.rb")  #Moving out 1 folder
require_relative("../lib/task.rb")
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