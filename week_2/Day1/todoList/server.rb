require 'sinatra'
require 'sinatra/reloader'   #To reload page
require 'pry'

require_relative('lib/task.rb')
require_relative('lib/todo_list.rb')

todoList=TodoList.new("Karin")
task1 = Task.new("Walk the dog")
task2 = Task.new("Buy the milk")
task3 = Task.new("Make my todo list into a web app")
todoList.addTask(task1)
todoList.addTask(task2)
todoList.addTask(task3)
todoList.save

get '/tasks' do
	@name="Karin"
	@todoList=todoList.load_task(@name)
	erb(:todo_list)
end

get '/new_task' do
	erb(:new_task)
end

#Add task
post '/user_input' do
	new_task = Task.new(params[:task])
	todoList.addTask(new_task)
	todoList.save
	redirect to '/new_task'
end

get '/find_task_by_id' do
	erb(:find_task)
end

get 'tasks' do
	erb(:todo_list)
end

#Mark task as completed
post '/complete_task/' do
	 
	if params[:action] == "add"    #To verify which  button i'm pressing(this case is the "mark as deleted")
		
		id=params[:task_input].to_i
	    @task_data=todoList.findTask(id)
	
		if @task_data.nil?
			@message_user=nil
			 redirect to '/find_task_by_id'
		else
		    @task_data.complete!
		    todoList.save
		    redirect to '/tasks'
		end
	else      #I press here the delete button params[:action] ="delete"
		
		id=params[:task_input].to_i
		@task_data=todoList.findTask(id)
	
		if @task_data.nil?
			@message_user=nil
			 redirect to '/find_task_by_id'
		else
		    todoList.deleteTask(id)
		    todoList.save
		    redirect to '/tasks'
		end
		
	end
		
end


