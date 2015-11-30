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
		if sandwich.nil?
			error={ error: "Sandwich not found"}
			render json: error,status: 404
		else
			ingredients=sandwich.ingredients.find_by(id: params[:id])

			if ingredients.nil?
				error={ error: "Ingredient not found"}
				render json: error, status: 404
			else
				render json: ingredients
			end
		end
	end

	def destroy
		sandwich=Sandwich.find_by(id: params[:sandwich_id])
		if sandwich.nil?
			error={error: 'Sandwich not found'}
			render json: error, status: 404
		else
			ingredients=sandwich.ingredients.find_by(id: params[:id])
			if ingredients.nil?
				error={error: 'Ingredients not found'}
				render json: error,status: 404
			else
				ingredients.destroy
				render json: ingredients
			end
		end
	end


	private 
	def ingredients_params
		params.require(:ingredients).permit(:name,:calories,:sandwich_id)
	end
end
