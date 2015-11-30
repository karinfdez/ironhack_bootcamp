class IngredientsController < ApplicationController

	def index
		sandwich=Sandwich.find_by(id: params[:sandwich_id])
		ingredients=sandwich.ingredients.all
		render json: ingredients
	end

	def create
		sandwich = Sandwich.find_by(id: params[:sandwich_id])
		ingredients=sandwich.ingredients.create(ingredients_params)
		render json: ingredients
	end

	def show
		sandwich=Sandwich.find_by(id: params[:sandwich_id])
		ingredients=sandwich.ingredients.find_by(id: params[:id])
		if sandwich.nil?
			error={"Sandwich not found"}
			render json: error,status: 404
		else
			render json: ingredients
		end
	end

	def update
	end


	private 
	def ingredients_params
		params.require(:ingredients).permit(:name,:calories,:sandwich_id)
	end
end
