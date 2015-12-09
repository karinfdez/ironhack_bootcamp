Rails.application.routes.draw do
  
  #Leave this route on top to show form and list of posts on the post's link.
  get '/posts'=>'posts#index_all'
  resources :photos
  devise_for :admins
  devise_for :users
  resources :events

  resources :users do
    resources :posts
  end 

  resources :posts do    
    resources :comments
  end
  
  
  get "pages/about"=>"pages#about"
  get "pages/gallery"=>"pages#gallery"
  root "pages#show", page: "home"
  

  #To show list of all posts(same controller)
  
  # root 'events#index'
  
end

