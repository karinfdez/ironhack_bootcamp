Rails.application.routes.draw do


  devise_for :users

  get '/'=>"concertnets#index"     #URL follows the name of model
  
  get '/concertnets/new'=>"concertnets#new"
  post '/concertnets' =>"concertnets#create"  #Where I want the information to be post. On /concerts
  get "/concertnets/add_comment" =>"concertnets#show"
  get "/concertnets/:concertnet_id/comments" => "comments#index"
  post "/concertnets/:concertnet_id/comments"=>"comments#create", as: :concertnet_comments

  # resources :concertnets do
  # 	resources :comments
  # end
  
end
