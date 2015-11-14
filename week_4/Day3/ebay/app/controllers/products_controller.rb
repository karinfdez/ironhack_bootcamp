class ProductsController < ApplicationController
	# def index
	# 	@users=User.all
	# 	# @products=Product.order(created_at: :desc)
	# 	render 'index'
	# end

	# def show
	# 	#Variable that contains the user id.
	# 	id=params[:id]
	# 	@users=User.find_by(id: id) 

	# 	if @users==nil
	# 		redirect_to("/404")
	# 	else
	# 		render 'show'
	# 	end
	# end

	def new
		render(:new)
	end

	def create
		# id=params[:project_id]
		# @users=User.find_by(id: id)
		# @products=@users.products.new(entry_params)   #method passed as parameter)
		# if @products.save
		# 	redirect_to action: "index",controller: "entries", project_id: @proj.id
		# 	# redirect_to("/projects/#{@proj.id}/entries")
	 #   else
	 #   	 render 'new'  #Send me to the form again
	 #   end

		# id=params[:id]
		# @users=User.find_by(id: id) 

		# render "create"
	end

	def destroy
	end

end


