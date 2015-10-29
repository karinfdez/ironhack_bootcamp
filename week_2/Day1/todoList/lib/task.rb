
class Task

    attr_reader :id, :created_at, :content, :updated_at, :completed, :updated_at
    @@current_id = 1
    def initialize(content)
        @content = content
        @id = @@current_id
        @@current_id += 1
        @completed=false
        @created_at=Time.new
        @updated_at=nil   #Later on is going to have the current time
    end

	def update_content!(content)
		@content=content
		@updated_at=Time.new
	end

	def complete?
		@completed  
	end

	def complete!
		@completed=true
		
	end

	def make_incomplete!
		
		@completed=false	
	end

end
