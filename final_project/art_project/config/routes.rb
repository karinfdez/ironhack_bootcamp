Rails.application.routes.draw do
  
  
  root 'events#index'
  devise_for :admins
  devise_for :users
  resources :events

  resources :users do
  	resources :posts 
  end

  resources :post do
  	resources :comments
  end

   get "/pages/:page" => "pages#show"
end

