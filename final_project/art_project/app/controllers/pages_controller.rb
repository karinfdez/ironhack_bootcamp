class PagesController < ApplicationController
	
	def show
		# This will send every url that matches /pages/ to the pages controller 
		 render template: "pages/#{params[:page]}"
    end
end
