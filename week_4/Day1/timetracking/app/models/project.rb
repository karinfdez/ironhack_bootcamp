class Project < ActiveRecord::Base
	has_many :entries

   # validates(:name,{presence: true})
   # validates(:name,{length: {in: 1..25}})
   # validates (:id,{exclusion: {in [1,2,3]}}) #On id you can't enter any of this.
   
   #Makes shure input for count is a number, in this case only integers
   # validates(:counter,{numericality: {only_integer: true}})

   #Validates uniqueness and presence of name. with a length maximum of 30 characters
   validates :name, { uniqueness: true, presence: true,length: {maximum: 30}}  

   #Include alphanumeric characters and spaces:
   # validates(:name, format: { with: /^[0-9a-zA-Z ]+$/})  #Allow validation for alphanumeric and spaces only.
  
   

end
