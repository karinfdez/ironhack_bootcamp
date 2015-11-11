class ContactsController < ApplicationController
	def index
		
		 @contacts=Contact.order('name ASC')
		 # @contacts=Contact.all  #Shows me all contacts
		 render 'index'
	end

	def new
		render "new"
	end

	def create
		# render(:text => "This route is contacts#create.")
    # render(:text => params.inspect)   #Show me how is the information is saved on contact. This a hash with a contact inside, and have hashes inside
	# render(:text => params[:contact].inspect)   #Here I just showing what I create. The keys that are inside contact.
	# render(:text => params[:contact][:name]) #Just print
		@contact = Contact.new(
	      :name => params[:contact][:name],
	      :address => params[:contact][:address],
	      :phone_number => params[:contact][:phone_number],
	      :email_address => params[:contact][:email_address])
		
		# puts "ASDFDFGFGDFGDFGDFGDFGDFGDFGD================"
		# p contact.name
		# p contact.address
		if !(@contact.name=="" && @contact.address=="") #VALIDATION
			@contact.save
			redirect_to("/")   #To all the lists of contacts, included the new one that I created
		
		    # render(:text => contact.attributes)
		    # render(:text => "save")
		else
			# @contact
		    render(:text => "Fill the name or address fields")
		end
		
	end

	def show

		id=params[:id]					#To show the user the id of contact on the url
		@contacts=Contact.find_by(id: id)     #From here I should go and create a show.html.erb on views folder
		if @contacts==nil
			redirect_to("/404")
		else
			render 'show'
		end
	end

	def favorite
		id=params[:id]	
		@contacts=Contact.find_by(id: id)
		# @contacts.favorite=true   #Change the state of favorites to true
		# @contacts.save
		#better way and straight to do it:
		@contacts.update(favorite: true)   #Change favorites to true and save it
		redirect_to("/contacts/favorites") #Redirecting from this action to showfavorite action and the showfavorite.html.erb
	end                                    #There is where I use the get("/projects/favorites")

	def showfavorites
		# id=params[:id]					#To show the user the id of contact on the url
		@contacts=Contact.where(favorite: true)     #From here I should go and create a show.html.erb on views folder
		if @contacts==nil
			redirect_to("/404")
		else
			render 'showfavorites'
		end
	end

	# def findcontact
	# 	name=params[:name]
	# 	@contacts=Contact.where(name: )
	# end

end
