class SandwichesController < ApplicationController
		def index
		sandwiches=Sandwich.all
		render json: sandwiches
		end

		def create
			sandwich=Sandwich.create(sandwich_params)
			render json: sandwich
		end
		def show
			my_sandwich= Sandwich.find_by(id: params[:id])
			if my_sandwich.nil?
				error={ error: "Sandwich not found"}
				render json: error, status: 404
			else
				render json: my_sandwich
			end
		end

		def update
			sandwich=Sandwich.find_by(id: params[:id])
			if sandwich.nil?
				error={error: "Sandwich not found"}
				render json: error, status: 404
			else
				sandwich.update(sandwich_params)
				render json: sandwich
			end
		end

		def destroy
			sandwich=Sandwich.find_by(id: params[:id])

			if sandwich.nil?
				error={error: "Sandwich not found"}
				render json: error, status: 404
			else
				sandwich.destroy
				render json: sandwich
			end
		end


		private
		def sandwich_params
			params.require(:sandwich).permit(:name,:bread_type)
		end
end
