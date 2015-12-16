var fs=require('fs');   //To read from a file

function fileActions (error,episodes){
	if(error){
		console.log("You have an error");
		throw (error);
	}
	else{
		var parseEpisodes=JSON.parse(episodes);   //Convert the content of the file on an object(array)
		var parseEpisodes=parseEpisodes.sort(function(a,b){ 
			return a.episode_number-b.episode_number});    //Sort array by episode number
        
        function isLowRating(value) {
  			return value.rating<8.5;     //Prints episodes with rating less than 8.5
		}

		function hasJohnFilter(episode){
		 	if(episode.description.indexOf("Jon") !== -1){
		 		return true;
			}
		}
	    var parseEpisodes=parseEpisodes.filter(isLowRating);
	    var hasJohn = parseEpisodes.filter(hasJohnFilter);
    }
    printGame(hasJohn);   //Only filters by artis 'Jon'


function printGame(document){

	    document.forEach(function (episodes){
			console.log("Title:" + episodes.title + " "+ "Number: "+ episodes.episode_number);
			console.log(episodes.description);
			var floatRating=parseFloat(episodes.rating);
			var integerRating=Math.floor(floatRating);
			console.log(integerRating );
			console.log("rating: "+ episodes.rating+" "+ printStars(integerRating) + "\n");
			console.log(searchFor(episodes,"Jon"));
		});
		
}

function printStars(integerRating){
 	
 	var stars = "";
 	for (var i = 0; i < integerRating; i++) {
 		stars += "*";
 	}
 	return stars;
 }

 function searchFor(episode,episodeName){

 	var number=(episode.description).indexOf(episodeName);
 	
 	if (number!== -1){
 		console.log("The artist "+ episodeName + " is on:");
 		console.log(episode.description);
 	}
 	else {
 		console.log("It wasn't possible to find " + episodeName+ " on the list.")
 	}
 }

fs.readFile('./GoTEpisodes.json','utf8',fileActions);

//json: javascript object notation