require 'date'

class Post
	attr_accessor :title, :text, :date,:sponsor
	
	def initialize(title,text)
		@title=title
		@date=Time.now
		@text=text
		@array=[]
	end
end



