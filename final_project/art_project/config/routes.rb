Rails.application.routes.draw do
  
  
  devise_for :admins
  root 'events#index'
  
  devise_for :users
  resources :events
  resources :users do 
  	resources :posts
  end
  
end
