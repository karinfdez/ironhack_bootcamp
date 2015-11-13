Rails.application.routes.draw do


  get '/concertnets'=>"concertnets#index"     #URL follows the name of model
  
  get '/concertnets/new'=>"concertnets#new"
  post '/concertnets' =>"concertnets#create"  #Where I want the information to be post. On /concerts
  # resources :concertnets
end
