class Fixnum
	def + (other_number)
		self - other_number
	end
end


puts 10 + 5

class Array
	def push(item)
		puts "I am not pushing your '#{item}'"
	end
end

my_array=[]
my_array.push("hello")
