# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string
#  last_name              :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  users_description      :string
#  admin                  :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  #This is call on every model I will need to upload an image
  mount_uploader :image,ImageUploader
  #Validations
  #Minimum 2 characters per name. Maximum 50 characters.
	validates :first_name, presence: true, length: { in: 2..50 }
	validates :password, length: { maximum: 50 }
  
  # scope :all_except, ->(user) { where(["admin: NOT IN (?)"])}

  #Defining method 'except' to be use to show users except admin.
  # scope :all_except, ->(user) { where(["admin NOT IN (?)"])}

  # def role?(role)
  #   roles.include? role.to_s
  # end


  has_many :posts

  #I would like to add this helper method when public trying to log in.
	#validates_exclusion_of :email, in: %w( admin superuser ), message: "You don't belong here"
end
