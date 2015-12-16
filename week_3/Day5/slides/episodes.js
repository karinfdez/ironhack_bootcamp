var fs=require('fs');


// var size=require('window-size');

function getSlides(err, file){ 
    if (err) {
        console.log(err);
        throw err;
    }
    else{

	    var allUserData=file.split("----"); 
		function logStuff (userData) {
		    if ( typeof userData === "string")
		    {
		        console.log(userData[item]);
		    }
		    else if ( typeof userData === "object")
		    {
		    	
		    	console.log(userData[0]);
		    	console.log(">");
				process.stdin.setEncoding('utf8');
				var userInput;
				process.stdin.on('readable', function() {
				    userInput = process.stdin.read();       
				    if (userInput !== null && userInput==="next") {
				        userData[1];
				        process.exit();
	                }
                });
            }
        }
    


		   //  	console.log(userData[0]);
		   //  	console.log(">");
		   //      for (var index in userData) {
		        		
					// 	process.stdin.setEncoding('utf8');
					// 	process.stdin.on('readable', function() {
					// 	var userInput = process.stdin.read();
					// 	console.log(userInput);
					// 	if (userInput ==="next")
					// 		console.log(userData[index]);
					// });
		   //      }
	    //     }
	    // }
		function getInput (options, callback) {
		    if (typeof callback === "function") {
		    	callback (options);
		    }
		}
	}
	  getInput (allUserData, logStuff);   
}
	 
// }
// 	//     arraySlides.forEach(function (sentence){
// 	//     	console.log(sentence);
// 	//     console.log(">");
// 	// 	process.stdin.setEncoding('utf8');
// 	// 	process.stdin.on('readable', function() {
// 	// 	var userInput = process.stdin.read();
// 	// 		if (userInput !==null) {
// 	// 			console.log("Hello ".concat(userInput, ". How are you"));
// 	// 			return;
// 	// 		// process.exit();
// 	// 	}
// 	// });
// 	//     });

//  //    }
// // }
// // var allUserData =file.split("----");  ;

 fs.readFile("./episodes.txt", 'utf8', getSlides);
// // console.log(this.allUserData);


// // function promptUser(){

// // 	console.log(">");
// // 	process.stdin.setEncoding('utf8');
// // 	process.stdin.on('readable', function() {
// // 	var userInput = process.stdin.read();
// // 		if (userInput === "next") {

// // 		 //    console.log("Hello ".concat(userInput, ". How are you"));
// // 			// process.exit();
// // 		}
// // 	});
// // }


