$(document).on("ready",function(){

 var phrases=['hello world','Goodbye Lenin','Hasta mannana','Love more','Dream...'];
 	var value="";
	//Iteration 1:

	// $(".hello-button").on("click",function(){
	// 	// Random number between 0 and the items on pharses-1
	// 	 var randomNumber=Math.floor((Math.random() * phrases.length));
	// 	 if($(".addText").text()!=="")
	// 	    $('.addText').html($('.addText').children());

	// 	 $(".addText").append(phrases[randomNumber]);
	// });
	
	// Iteration2:
	$(".text-input").on("keypress",function(){
		
		 var inputText=$(".text-input").val();

		 if(inputText!=="")
		    $('.addText').html($('.addText').children());

		 $(".addText").append(inputText);
	});

		
		// $(".addText").text(inputText);
});

	// $(".text-input").on("change",function(){
	// 	var result=$('.text-input').val();
	// 	console.log(result);
	// });

