Rails.application.routes.draw do
  get '/'=>'contacts#index'
  get '/contacts/new'=>'contacts#new'   #TO show the form
  post("/contacts", :to => "contacts#create")   #to go to de action 'create'.
end
