function ShoppingCart(){
	this.list=[];
}

function Item(item,price){
	this.item=item;
	this.price=price;
}

ShoppingCart.prototype.addItems = function (item){
    this.list.push(item);
}

ShoppingCart.prototype.getTotal=function(myList){
	function item(element, index, array) {
  	console.log('a[' + index + '] = ' + element);
}
	//Create a function that holds only the items prices.
	myList.map(function(itemPrice);
}


var apple=new Item("apple",10);
var orange=new Item("orange",5);
myList=new ShoppingCart();
myList.addItems(apple);
myList.addItems(orange);

