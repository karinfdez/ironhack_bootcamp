require "pry"
class Login

	
	def initialize(username,password)
		
		@username = username
		@password= password
		@credentials = [
			{:username => "carola", :password=>"rodriguez"},
			{:username => "manolo", :password=>"perez"},
			{:username => "johnny", :password=>"garcia"},
			{:username => "karin", :password=>"fernandez"}
		]
	end

	def is_valid?
		tracker = false
		@credentials.each do |index|
			if index[:username]==@username && index[:password]==@password
				tracker = true
		    end
	    end

	    tracker
	end
end