
# Write a function in in Ruby that receives two strings as arguments. 
# The function should figure out whether the second string is the same as the first,
#  possibly with one typo.

# Let's say your first string is pizza. If the second string is also pizza, return true.

# If the second string is pzza, it's only missing the i. In that case it's off by one 
# character so we should return true. Similarly, if the second string is missing a 
# different character, return true. Examples would be: pizz, izza, piza, etc. 
# If it's missing two or more characters (like with pzz), return false.

# If the second string is pizzza, it has an extra z. In that case it's also off by one
#  character, so we would return true. Similarly, if the second string has any 
#  one additional character, return true. Examples would be: pizzaz, opizza, piuzza, etc. 
#  If the second string has two or more additional characters, return false.

# If the second string is puzza, it's got a u where an i should be. In that case it's also
# off by one character, so we would return true. Similarly, if the second string has any 
# only one character that is incorrenct, return true. Examples would be: oizza, pixza,
# pizzs, etc. If the second string has two or more characters that are incorrect, **return 
# false.

def typo?(string1, string2)
	
	counter=0
	typo=false

	if string2.length<=string1.length+1
		counter=string1.count(string2)
	end
	
	if (counter<=string1.length+1 && counter>=string1.length-1)
		typo=true
	end
	 puts typo
end


typo?("cake", "bake") #=> true
typo?("cake", "cakes") #=> true
typo?("cake", "cke") #=> true
typo?("cake", "ck") #=> false
typo?("cake", "casker") #=> false
typo?("cake", "base") #=> false
