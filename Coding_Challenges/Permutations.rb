
#String permutations
# Imagine you've got a string like presentable and you scramble the letters to get 
# a second string like albrnpeetse. The second string is called a permutation of the first.
# A permutation of a string is any string that has exactly the same characters as the 
# original but in a different order.

# Write a function in Ruby or JavaScript that receives two strings as arguments.
# The function should figure out whether or not those two strings are permutations of 
# each other. It should return true if they are permutations of each other or return false if they are not permutations of each other.


def permutations(string1, string2)

	permutation=false
	array=string2.split('')

	arrayPermutations=array.permutation.map &:join 

	for i in 0..arrayPermutations.length
		if string1.eql? arrayPermutations[i]
			permutation=true
		end
	end
	p permutation
 end


# permutations("presentable", "albrnpeetse") #=> true
# permutations("presentable", "raelsbtpene") #=> true
# permutations("presentable", "taco")        #=> false
permutations("taco", "cato")                 #=> true
permutations("ela", "lae")                   #=>true
permutations("taco", "cat")                  #=> false
permutations("yes", "mila")                  #=>false



