var numbers='80:70:90:100';
function averageColon(numbers){
	
	// Store inside an array the numbers as a string
	var newNumbers=numbers.split(":");
	
	// Converting strings on integers and putting on new array
	var intArray=newNumbers.map(function(number){
		return (parseInt(number));
	});
	// console.log(intArray);

	// Adding all numbers together
	var sum=intArray.reduce(function(number1,number2){
						return number1+=number2;
	});
	var average=sum/intArray.length;
	console.log(average);
}
averageColon(numbers);
