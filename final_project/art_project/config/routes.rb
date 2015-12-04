Rails.application.routes.draw do
  
  
  root 'events#index'
  devise_for :admins
  devise_for :users
  resources :events

  resources :users do
  	resources :posts
  end
  # #In order to separate admins page of user's page
  #  get '/admins/index'=>'admins#index'
 
  
end
