class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #Validations
  #Minimum 2 characters per name. Maximum 50 characters.
	validates :first_name, presence: true, length: { in: 2..50 }
	validates :password, length: { maximum: 50 }
  has_many :posts

  #I would like to add this helper method when public trying to log in.
	#validates_exclusion_of :email, in: %w( admin superuser ), message: "You don't belong here"
end
