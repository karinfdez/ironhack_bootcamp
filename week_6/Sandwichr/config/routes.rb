Rails.application.routes.draw do
  #Use all routes, except the ones that show the form
  resources :sandwiches, except: [:new, :edit] do
  	resources :ingredients, except: [:new, :edit]
  end
end
