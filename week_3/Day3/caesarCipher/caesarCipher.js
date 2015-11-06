function caesarCipher(message){
	return message.split("");
}

var encrypted = caesarCipher("brutus");
console.log(encrypted);
// console.log(encrypted);
console.log("z".charCodeAt(0));  //Gives me the ASCII number
console.log( "za".charCodeAt(1)); //Returns the number of letter on position 1 on string(in this case letter a)
console.log( "b".charCodeAt(0));

console.log( String.fromCharCode(111) );  //Returns the letter that goes with that ASCII number