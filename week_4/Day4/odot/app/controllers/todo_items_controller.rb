class TodoItemsController < ApplicationController
  
  def index
  	#Find the todo_list by id.
  	id=params[:todo_list_id]
  	@todo_list=TodoList.find(id)
  end
end
