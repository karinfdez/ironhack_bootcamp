class Entry < ActiveRecord::Base
	belongs_to :project

	#validates hours and minutes to be numbers:
   validates(:hours, {numericality:true})
   validates(:minutes,{numericality: true})
   
   #validates presence of date, hours and minutes.
   validates(:date,{presence: true})
   validates(:hours,{presence: true})
   validates(:minutes,{presence: true})
   validates(:project_id,{presence: true})

end
