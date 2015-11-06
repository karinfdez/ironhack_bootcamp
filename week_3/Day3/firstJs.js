function eat(food){

if(food==="pizza")
	console.log("Yay pizza");
else if(food==="cookies")
	console.log("Cookies are good too");
else
	console.log("Ok, enjoy eating "+ '"' + food+ '"');

}

eat("pate");


var food=["pizza","cookies","pate"];
food.forEach(function(myfood){
	// console.log(food.split(""));
	console.log(myfood.toUpperCase());
});

// Returns a new array with the elements of the old array
var capsFood=food.map(function(food){
	return food.toUpperCase();
});
console.log(capsFood);

var msg=food.reduce(function(pre,myfood){
	return pre + " AND " +myfood;
});
console.log(msg);