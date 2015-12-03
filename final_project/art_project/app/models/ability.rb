class Ability
	include CanCan::Ability

	#Here is defined the artist and admin permissions
	def initialize(user)
  	# model class or model type(after the :)
  	#users will be able to read only the models
  		can :read, :all
	end
end