Rails.application.routes.draw do
  get '/'=>'contacts#index'
  get '/contacts/new'=>'contacts#new'   #TO show the form
  post("/contacts", :to => "contacts#create")   #to go to de action 'create'.
  get '/projects/:id' => 'contacts#show'     #This is the first step, then I should go to to constacs_controller
  											# and create my show method
  post("/contacts/:id/favorite", :to => "contacts#favorite") #To go to the action "favorite where I save the favorites contacts"
  get "/contacts/favorites" =>'contacts#showfavorites'        #To show the favorites contacts

#I got this one from the the form that has the same action name
  # post("/contacts/<%= @contacts.id %>/byfirstletter", :to => "contacts#findcontact") #To go to the action "favorite where I save the favorites contacts"
#Now I have to go to findcontact action on the controller   

end                                                           #Get those on my showfavorites method
