require_relative("./task.rb")
class TodoList
	attr_reader :tasks, :content
	def initialize
		@tasks=[]
    end

    def addTask(task)
    	@tasks.push(task)	
    end

	def deleteTask(id)
		@tasks.delete_if {|hm| hm.id ==id }  
	end

	def sort_by_created
		sorted_tasks = @tasks.sort { | task1, task2 | task2.updated_at<=> task1.updated_at }
	end

	def findTask(id)
		
		arrayIndex=@tasks.index { |hm| hm.id == id }

		if arrayIndex.nil?
			task=nil
		else
			task=@tasks[arrayIndex].content
		end
		task
	end
	# def sort_by_created

	#  sorted_tasks = @tasks.sort { | task1, task2 | task1<=> task2 }
	# end
end