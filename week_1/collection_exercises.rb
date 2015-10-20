
# .each exercise

class ProgrammingLanguage

	attr_accessor :name, :age, :type

	def initialize(name, age, type)
	
		@name=name
		@age=age
		@type=type
	end
end

ruby=ProgrammingLanguage.new("Ruby",21,"Dynamic")
python=ProgrammingLanguage.new("Python",24,"Dynamic")
javascript = ProgrammingLanguage.new("JavaScript", 20, "Dynamic")
go = ProgrammingLanguage.new("Go", 6, "Static")
rust = ProgrammingLanguage.new("Rust", 5, "Static")
swift = ProgrammingLanguage.new("Swift", 2, "Static")
java = ProgrammingLanguage.new("Java", 20, "Static")

array_of_languages = [ruby, python, javascript, go, rust, swift, java]


 # array_printer(array_of_languages)

 # This is first to modify the age
 aged_languages = array_of_languages.map do |hm|
 					hm.age+=1
 					hm   #This return all the array with the changes made.If I don't do this only return the age.
 				end
def array_printer(array)
	array.each do |hm|
		puts "Language: #{hm.name}, Age: #{hm.age}, Type: #{hm.type}"
	end
end


puts "The programming languages aged one year are: "
 # array_printer(aged_languages)
# Output
# The programming languages aged by one year are:
# Language: Ruby |  Age: 22 |  Type System: Dynamic
# Language: Python |  Age: 25 |  Type System: Dynamic
# Language: JavaScript |  Age: 21 |  Type System: Dynamic
# Language: Go |  Age: 7 |  Type System: Static
# Language: Rust |  Age: 6 |  Type System: Static
# Language: Swift |  Age: 3 |  Type System: Static
# Language: Java |  Age: 21 |  Type System: Static



# Sort:

sorted=aged_languages.sort do |hm1,hm2|
	hm2.age<=>hm1.age
end
array_printer(sorted)
# The programming languages sorted by age are:
# Language: Python |  Age: 25 |  Type System: Dynamic
# Language: Ruby |  Age: 22 |  Type System: Dynamic
# Language: JavaScript |  Age: 21 |  Type System: Dynamic
# Language: Java |  Age: 21 |  Type System: Static
# Language: Go |  Age: 7 |  Type System: Static
# Language: Rust |  Age: 6 |  Type System: Static
# Language: Swift |  Age: 3 |  Type System: Static