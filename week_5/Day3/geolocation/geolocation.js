 //npm -g install http-server: this shouldbe install on the terminal to use the geolocation.
 //Then on terminal run http-server
 //now I can use this URL http://localhost:8080/geolocation.html to see the geolocation.

function gotPosition(currentPost){
	// alert("Yay!");
	
	var latText="Latitude: "+ currentPost.coords.latitude;
	var lonText="Longitude: "+currentPost.coords.longitude;
	//Change the text on the li.
	$(".js-latitude").text(latText);
	$(".js-longitude").text(lonText);
	// console.log(currentPost);
	// console.log("Latitude: "+currentPost.coords.latitude);
 //    console.log("Longitude: "+currentPost.coords.longitude);
    $(".js-coordinates").fadeIn();
    $(".js-loading-text").fadeOut();
}

function positionError(){
	 $(".js-loading-text").fadeOut();
	 $(".js-pos-error").fadeIn();

}

$(document).on("ready",function(){
	
	if("geolocation" in navigator){
		// Parameters are 2 callbacks an an object.
		navigator.geolocation.getCurrentPosition(gotPosition,positionError);
		
	}
	else
		console.log("Geolocation is not available");
});