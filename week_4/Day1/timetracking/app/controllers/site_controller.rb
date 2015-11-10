class SiteController < ApplicationController
	def home
		render 'home' #Name of view template
	end

	def contact
		render 'contact'
	end
end

