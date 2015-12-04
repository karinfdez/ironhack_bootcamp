Rails.application.routes.draw do
  
  
  root 'events#index'
  devise_for :admins
  devise_for :users
  resources :events

  resources :posts
  resources :users do 
  end
  # #In order to separate admins page of user's page
  #  get '/admins/index'=>'admins#index'
 
  
end
