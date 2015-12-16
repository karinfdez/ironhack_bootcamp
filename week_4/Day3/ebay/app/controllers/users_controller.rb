class UsersController < ApplicationController
	def index
		@users=User.all
		# @products=Product.order(created_at: :desc)
		render 'index'
	end

	def show
		#Variable that contains the user id.
		id=params[:id]
		@users=User.find_by(id: id) 

		if @users==nil
			redirect_to("/404")
		else
			render 'show'
		end
	end
end
