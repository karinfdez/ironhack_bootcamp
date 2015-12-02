class Post < ActiveRecord::Base

	
	#title and content can't be blank. Length minimum 5 character for title.
	validates :title,:content, presence:true 
	validates :title, length:{ minimum: 2 }
	validates :title, uniqueness: true
    validates :content, length: {minimum: 10}
end