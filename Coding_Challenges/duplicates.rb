# You have one array with 10,000 unique strings in it, we will call this array A
# You have another array with 10,000 unique strings in it, we will call this array B.
# We know that each array has 10,000 unique strings in it, but there might be some 
# duplicates between array A and array B. How do we find those duplicates?
# Hint: There's probably hundreds of ways to solve this problem, some are faster 
# than others.

def findDuplicates(array1,array2)

	duplicate=false
	(0..array2.length-1).each do |i|
		duplicate=array1.include?array2[i]
		if duplicate
			break
		end
    end
    puts duplicate
end

array1=["hello","milena","goodbye","see","blast","sing"]
array2=["sea","smile","milena","dance","blast"]
array3=["mind","over","matter","yes","no"]

findDuplicates(array1,array2)  #true
findDuplicates(array1,array3)  #false
findDuplicates(array2,array3)  #false