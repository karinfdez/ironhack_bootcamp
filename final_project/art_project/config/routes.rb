Rails.application.routes.draw do
  
  get "/pages/:page" => "pages#show"
  # Loaded as my home page
  root "pages#show", page: "home"

  #To show list of all posts(same controller)
  get '/posts'=>'posts#index_all'
  # root 'events#index'
  devise_for :admins
  devise_for :users
  resources :events

  resources :users do
  	resources :posts
  end 

  resources :posts do    
    resources :comments
    end


  # resources :post do
  	
  # end
end

