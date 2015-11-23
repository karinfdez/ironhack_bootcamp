$(document).on("ready",function(){
	
	$('.js-show-characters').on("click",function() {
		
		// A call to ajax to do a request to that url for information.Get info
		$.ajax({
			// URL of the API of the request(request data on this API):
			url: "https://ironhack-characters.herokuapp.com/characters",
			
			success: function(characters_info){
				// Leave empty the list every time I press the button. I do it before adding elements.
				//Always show me the same names and doesn't repeat.
				$(".js-characters-wrapper ul").empty();
				// alert("Yay! Success.");
				// console.log(characters_info);
				characters_info.forEach(function(character){
					// console.log("Name: " + character.name);
					var liHtml="\
					<li>\
					"+character.name+"\
					<em>" + character.occupation + "</em>\
					<span>"+character.weapon+"</span>\
					</li>";
					// var liHtml="<li>"+character.name+"</li>";
					$('.js-characters-wrapper ul').append(liHtml);
				});
			},
			error: function(){
				alert("ZOMG ERROR");
			},
    // Means that this API should read as json:
			dataType: "json"
		});

	});

    // When button is press(type="submit"), it submits the form.

    function saveInput(characters_info){
    	console.log(characters_info);
    };
    function feilure(){
    	alert("Error posting the user's input");
    };
		// Here with the "event" I let in html know that I dont whant to fallow
		//Instead use the javascript.
    $('.js-submit-form').on("submit",function(event) {
    	event.preventDefault();
		var newCharacter={
			name: $(".js-name").val(),
			occupation: $(".js-occupation").val(),
			weapon: $(".js-weapon").val(),
	    };
			// Post this information on the url.
			$.ajax({
				type:"POST",
				url: "https://ironhack-characters.herokuapp.com/characters",
				data: newCharacter,
				success: saveInput,
				error: feilure,
				dataType: "json"
			});

	});
	(".btn-lg").on("click",function(){
		$('#myModal').modal('toggle');
		$('#myModal').modal('show');
		$('#myModal').modal('hide');
	});
});