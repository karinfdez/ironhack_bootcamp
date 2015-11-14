class TodoList < ActiveRecord::Base

	validates :title, presence: true
	validates :title, length: { minimum: 3 } #Minimum 3 characters to enter title.
	validates :description, presence: true
	validates :description, length: { minimum: 5 } 

	has_many :todo_items
end