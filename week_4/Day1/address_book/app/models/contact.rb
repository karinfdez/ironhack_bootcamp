class Contact < ActiveRecord::Base
	
	validates(:name,{uniqueness: true, presence: true, length:{minimum: 1}})
	validates(:address,{uniqueness: true, presence: true, length:{minimum: 10}})
	# This option can be used with the gem 'validates_email_format_of' on my gemfile.
    validates :email_address, email_format: { message: "Doesn't look like an email address" }
    # This validate with 123-123-1234 format
    validates :phone_number, format: { with: /\d{3}-\d{3}-\d{4}/, message: "Bad format" }
end
