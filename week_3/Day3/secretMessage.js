

var sentence="Fill the proper tank for the cow"

function decodeMessage(sentence,orientation,typeWords){
	
	arrayWords=sentence.split(" ");
	
	function filterEvenWords(element, index){   //When working with index I use always 2 arguments
		if (index % 2 === 0){
			return true;
		}	
	}
	function filterOddWords(element, index){
		if (index % 2 !== 0){
			return true;
		}	
	}
	
	var filteredArray=[];
	if(typeWords==="even")
		filteredArray = arrayWords.filter(filterEvenWords);
	
	else
		filteredArray = arrayWords.filter(filterOddWords);
	

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
// decodeMessage(sentence,"forwards","odd");
// decodeMessage(sentence,"forwards","even");

