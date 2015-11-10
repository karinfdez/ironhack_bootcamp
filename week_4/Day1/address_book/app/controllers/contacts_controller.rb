class ContactsController < ApplicationController
	def index
		 @contacts=Contact.all  #Shows me all contacts
		 render 'index'
	end

	def new
		render "new"
	end

	def create
		render(:text => "This route is contacts#create.")
	end


end
