var fs = require('fs');

function fileActions(err, file){ 
    if (err) {
        throw err;
    }

    var episodes = JSON.parse(file);
    episodes=(filterEpisodes(episodes));
    sortEpisodes(episodes);
    printEpisodes(episodes);
    console.log("Is Jon Snow in any of this episodes?: ")
  	searchFor(episodes, "Jon","Snow");
}

function sortEpisodes(episodes){
	return episodes.sort(function(a,b){ return a.episode_number-b.episode_number});
}

function printEpisodes(episodes){

	 episodes.forEach (function(episode){
    	console.log("Title: "+episode.title + " / Episode: "+ episode.episode_number);
    	console.log(episode.description);
    	starRating=parseInt(episode.rating)
    	console.log("Rating: "+episode.rating +" "+ Array(starRating+1).join("*"));
    	console.log();

    });
}

function filterEpisodes(array){

	return array.filter(function(episode){	return episode.rating<8.5});
}

// Check if a character is in each description.
function searchFor(episodes,firstName,lastName){
		counter=0;
	    episodes.forEach(function(episode){ 
		if (episode.description.indexOf(firstName) !== -1 && episode.description.indexOf(lastName) !== -1){
			console.log("Yes, "+firstName+" "+ lastName +" is in this episode:");
			console.log(episode.description);
			counter++;
		}
			
	});
	    if (counter===0)
	    	console.log("No, "+firstName+" "+lastName+" isn't in the episodes");
}

fs.readFile("./description.json", 'utf8', fileActions);
