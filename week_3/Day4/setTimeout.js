
function blastOff(seconds){
	
	function countdown(){
		console.log(seconds);
		seconds-=1;

		if(seconds>=0)
			setTimeout(countdown,1000);    //Call countdown function every 1 second
	    	console.log("blastOff!")
	}
	countdown();
}
blastOff(5);