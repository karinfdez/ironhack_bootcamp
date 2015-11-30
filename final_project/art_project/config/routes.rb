Rails.application.routes.draw do
  
  

  root :to =>redirect('/posts')
  resources :posts
  resources :users
  
end
