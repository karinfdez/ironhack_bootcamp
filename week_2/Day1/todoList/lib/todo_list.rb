require_relative("./task.rb")
require 'yaml/store'
require 'pry'

class TodoList
	attr_reader :tasks, :content
	
	def initialize(user)
		@tasks=[]
		@todo_store = YAML::Store.new("./public/tasks.yml")
		@user=user
    end

    def addTask(task)
    	@tasks.push(task)	

    end
    def load_task(name)   #from the document where i saved it
    	 @todo_store.transaction do 
 	   	 todos=@todo_store[name]
 	     @todos=todos
    	end
    end

	def deleteTask(id)
		@tasks.delete_if {|hm| hm.id ==id }  
	end

	def sort_by_created
		sorted_tasks = @tasks.sort { | task1, task2 | task2.updated_at<=> task1.updated_at }
	end

	def findTask(id)
		
		arrayIndex=@tasks.index{ |hm| hm.id == id }
		
		if arrayIndex.nil?
			task=nil
		else
			task=@tasks[arrayIndex]
		end
		task
	end

	def save
	 	 @todo_store.transaction do 
	     @todo_store[@user] = @tasks
	    end
    end	
end