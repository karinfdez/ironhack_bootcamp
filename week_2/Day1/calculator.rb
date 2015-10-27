
class StringCalculator

	def add(string)
		
	total=0
		if string.include?(",")
		    numberArray=string.split(",")
		    
		   	total=numberArray.reduce(0) do |sum,hm|
		   		sum+=hm.to_i
		    end
		elsif string.include?("\n")
			numberArray=string.split("\n")
		    
		   	total=numberArray.reduce(0) do |sum,hm|
		   		sum+=hm.to_i
		    end
		    
		end	
		total
	end
end


# calculator=StringCalculator.new
# result = calculator.add("")

# if(result!=0)
# 	puts "Wrong result for empty string"
# else
# 	puts "Correct result for empty string"
# end

# result = calculator.add("6")

# if(result!=6)
# 	puts "Wrong result for 6"
# else
# 	puts "Correct result for 6"
# end

#  result = calculator.add("4,3,7")

# if(result!=14)
# 	puts "Wrong result for 14"
# else
# 	puts "Correct result for 14"
# end