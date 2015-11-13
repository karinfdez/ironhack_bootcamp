class ConcertnetsController < ApplicationController
	def index
		# @concerts=Concertnet.all
		@concerts=Concertnet.where(date: (DateTime.now.beginning_of_day..DateTime.now.end_of_day))
		# @concertsAll = Concertnet.find(:all, :order => 'due_at, id', :limit => 50)
  # 		@concert_month = @concertsAll.group_by { |t| t.due_at.beginning_of_month }
    
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
	end

	private
	#Always rails require this method to avoid malicious input
	def concert_params
		params.require(:concertnet).permit(:artist,:venue,:city,:date,:description,:price)
	end
end
