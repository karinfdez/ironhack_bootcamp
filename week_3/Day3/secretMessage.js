

var sentence="Fill the proper tank for the cow"

function decodeMessage(sentence,orientation,typeWords){
	
	arrayWords=sentence.split(" ");
	
	function filterWords(value) {
  			if (typeWords==="even")
  				return value.length%2===0;
  			else if(typeWords==="odd")
  				return value.length%2!==0;
  			else
  				return value.length;
    }

	var filteredArray = arrayWords.filter(filterWords);
	
	if (orientation=="backwards") {
		arrayWords=filteredArray.reverse();
	}
	else if (orientation=="forwards") {
		arrayWords=filteredArray;
	}
	else{
		console.log("That's not the expected orientation. Try again");
		return;
	}

	getLetters(arrayWords);
}

function getLetters(arrayWords){
	
	var i=0;
 	var j=0;

	console.log(arrayWords);
	var letterArray = arrayWords.map(function(letters){
			
    if (i>=5){                             
		j++;
		return letters.charAt(j - 1);
	}
	else{
		i++;
		return letters.charAt(i - 1);
	}
		
	});
	
	var secretMessage=letterArray.reduce(function(letter1,letter2){
		return letter1+letter2;
	});
	console.log(secretMessage);
}


decodeMessage(sentence,"backwards","odd");
decodeMessage(sentence,"backwards","even");
decodeMessage(sentence,"forwards","odd");
decodeMessage(sentence,"forwards","even");

