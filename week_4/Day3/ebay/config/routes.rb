Rails.application.routes.draw do
  
#Each user can have multiple products
	resources :users do
		resources :products
	end
	  # get "/users"=>"products#index"
	  # get "/users/:id" =>"products#show"
	  # get "/users/:id/new_product" =>"products#new"

	
end