
$(document).on("ready",function(){
	$(".js-tacos").on("click",function(){
		alert("You click me");
	});

	// takes the current value of the input.
	// $(".js-text-input").on("change",function(){
	// 	var text=$(".js-text-input").val();
	// 	console.log("Current text: "+ text);
	// });

	// Show text letter by letter every time I type a word
	$(".js-text-input").on("keypress",function(){
		var text=$(".js-text-input").val();
		console.log("Current text: "+ text);
	});

	$(".js-dropdown").on("change",function(){
		var text=$(".js-dropdown").val();
		console.log("Current dropdown text: "+ text);
	});

// Takes the content from the input box and put it at the same time on the js-preview class.
//js-preview is an h1 tag that takes the value at the same time is been writting on the input box.
	$(".js-text-input").on("keypress",function(){
		var inputText=$(".js-text-input").val();
		$(".js-preview").text(inputText);
	});

	$(".js-button").on("click ",function(){
		// Tells to fade all, except html, body and and button. This fades if content is visible and show
		//content if isn't present.
		// $(":not('.js-button,body,html')").fadeToggle();
		// Removes all from body, except the button
		$("body :not('.js-button')").fadeToggle();
		// Show me what this button is taking (is an array)
		console.log($(":not('.js-button')"));

		if 	($(".js-button").text()==="Fade in"){
			$(".js-button").text("Fade out");
		}
		else{
			$(".js-button").text("Fade in");
		}
	});


});