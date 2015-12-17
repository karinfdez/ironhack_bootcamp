# A palindrome is a word or phrase that reads the same forwards and backwards. 
# For example, if you invert the phrase a car, a man, a maraca, you get acaram a, nam a,
#  rac a. After playing around with the commas and the spaces you get the original again: 
#  a car, a man, a maraca.

# Write a function in Ruby or JavaScript that receives a string as argument. The function 
# should figure out whether or not that string is a palindrome. It should return true if 
# the string is a palindrome and return false if the string is not a palindrome.


def palindrome?(string)
	
	isPalindrome=false
	
	 if string.scan(/[\w'-]+/).length != 1
		 string=string.gsub!(/[^0-9A-Za-z]/, '')
	 end	
	  inverseString=string.reverse
	 
	 if inverseString.eql? string
	 	isPalindrome=true
	 end
	 p isPalindrome
end



palindrome?("a car, a man, a maraca")  #=> true
palindrome?("campus motto: bottoms up mac")  #=> true
palindrome?("maps, dna, and spam")  #=> true
palindrome?("racecar")  #=> true
palindrome?("there's no place like home") #=> false
palindrome?("i like pizza")  #=> false


