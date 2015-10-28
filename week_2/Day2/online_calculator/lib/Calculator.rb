class Calculator
		

	def self.operation(first,second,button)
		@first=first
		@second=second
		@button=button
    
		case @button
			when "addition"
				@result=self.add
			when "substraction"
				@result=self.substract
			when "multiplication"
				@result=self.multiply
			when "division"
				@result=self.divide
		end
		"The result is #{@result}"
	end
	
	def self.add
		@first+@second
	end

	def self.substract
		@first-@second
	end

	def self.multiply
		@first*@second
	end
	def self.divide
		@first/@second
	end

end
	
