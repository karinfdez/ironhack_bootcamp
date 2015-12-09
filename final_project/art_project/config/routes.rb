Rails.application.routes.draw do
  
  resources :photos
 
   # get "/pages/gallery" => "image_galleries#index"
   
   # get "pages#show", page: "about"
  # Loaded as my home page
 
  get "pages/about"=>"pages#about"
  get "pages/gallery"=>"pages#gallery"
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

