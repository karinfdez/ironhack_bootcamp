
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
