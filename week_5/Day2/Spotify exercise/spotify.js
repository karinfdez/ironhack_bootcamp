// ajax Does request to Spotify API

$(document).on("ready",function(){
	// Search the info to the server

	$(".js-artist-submit").on("click",function(){
		var searchTerm=$(".js-artist-input").val();
		//TO avoid empty input
		//If it's empty string(evaluates falsy), I can't enter to the request.
		if(searchTerm){
			//Ajax to get artist and images.
			$.ajax({
				type:"GET", //Get this info from the server.
				url: 'https://api.spotify.com/v1/search?type=artist&query='+searchTerm,
				success: addArtistToHtml,
				error: errorGettingArtist,
				dataType: "json"
	        });
	        findAlbum(searchTerm);
	     }
    });

    function addArtistToHtml(response){
   
      var artistsList=response.artists.items.filter(function (it) {
  			return it.images.length > 0;
		});
      
	      artistsList.forEach( function (item){
	       	var artistName=item.name;
	    	var artistImage=item.images[0].url;
	       	var artistId = item.id;
	   		var artistInfo= "<li class=js-artist"  + "><p data-toggle=modal data-target=#myModal " + "data-id=" + artistId + 
	   		                ">Artist Name: "  + artistName + "</p>" +
	   		                "<img src= "+ artistImage +">" +"</img>"+
	   		                 "</li>"
		    
		     //Appending each list to the ul tag.
	     $(".js-list").append(artistInfo);	
		     	
	    $(".js-artist").on("click", function(event) {
		 	// console.log(event.target);
			//To see all the options the event has.
			// console.log('event:', event);
			//The id I include on the li.
		    var specificId = $(event.target).data('id');
			// console.log(specificId);
			findAlbum(specificId);
		});
	  });
    };		    
  
    function errorGettingArtist(){
     console.log("Error getting the Artist list.");
    };

	//Ajax to get the artist albums
	function findAlbum(specificId){
		$.ajax({
			type:"GET", //Get this info from the server.
		    url: 'https://api.spotify.com/v1/artists/5K4W6rqBFWDnAN6FQUkS6x/albums',
		    success: getAlbum,
		    error: errorGettingAlbum,
		    dataType: "json"
	     });
	};
	function getAlbum(response){
		response.items.forEach(function(album,index){
			 $(".js-wholeAlbum").append(index+": "+album.name);
			
		});
	};

	function errorGettingAlbum(response){
		console.log("Error getting Albums");
		
   };
   
});





