class ConcertnetsController < ApplicationController
	
   # Authentification of my actions only(new and create because
   # are the ones involve on creating concerts).
    before_action :authenticate_user!, only:['new','create']

	def index
		# @concerts=Concertnet.all
		@concerts=Concertnet.where(date: (DateTime.now.beginning_of_day..DateTime.now.end_of_day))
		@concerts_month=Concertnet.where(date: (Date.today.beginning_of_month..Date.today.end_of_month))
		@date = Date.today  
		render 'index'
	end
	

	def new
		@concerts=Concertnet.new  #I'm creating a concert.
		render 'new'
	end

	def create
		
		@concerts=Concertnet.new(concert_params)
		if @concerts.save
			redirect_to action: "index",controller: "concertnets"
			# redirect_to("/projects/#{@proj.id}/entries")
		else
			render 'new'  #Send me to the form again
		end
	end

	def show
		@date = Date.today  
	end

	private
	#Always rails require this method to avoid malicious input
	def concert_params
		params.require(:concertnet).permit(:artist,:venue,:city,:date,:description,:price)
	end
end
