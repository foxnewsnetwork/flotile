/************************
* Flotile Bridge Class          *
*************************/
// Do some renaming and whatnot to expose
// haXe class to regular javascript which is
// how I plan to make haXe code friendly with
// prior existing javascript code (to prevent 
// crap-tons of reinventing the world)

var SHOP_IMAGE_APPROVE = "madotsuki.png",  
SHOP_IMAGE_CANCEL = "madotsuki.png";

var SPECS_PAYMENTFORM = [
	{
		'tag' : 'div',
		'content' : "Checkout!"
	},
	{
		'tag' : 'div',
		'content' : "Name: "
	},
	{ 
		'tag' : "input",
		'type' : "text",
		'id' : 'name' ,
		'placeholder' : 'ex. Jack Jackson'
	},
	{
		'tag' : 'div',
		'content' : "Credit Card Number: "
	},
	{ 
		'tag' : "input",
		'type' : "text",
		'id' : 'creditcardnumber' ,
		'placeholder' : 'ex. 1234 4567 8901 2345'
	},
	{
		'tag' : 'div',
		'content' : "CCV: "
	},
	{ 
		'tag' : "input",
		'type' : "text",
		'id' : 'ccv' ,
		'placeholder' : 'ex. 449'
	},
	{
		'tag' : 'div',
		'content' : "Expiration: "
	},
	{ 
		'tag' : "input",
		'type' : "number",
		'id' : 'expiremonth' ,
		'placeholder' : '1',
		'size' : 30,
		'style' : "width: 2em"
	},
	{ 
		'tag' : "input",
		'type' : "number",
		'id' : 'expireyear' ,
		'placeholder' : '2012',
		'size' : 30,
		'style' : "width: 3em"
	},
	{
		'tag' : 'div',
		'content' : "Email: "
	},
	{ 
		'tag' : "input",
		'type' : "text",
		'id' : 'email' ,
		'placeholder' : 'ex. example@ex.com'
	}
];
/*
var NormalShop = function(){ 
	var shop = new main.Shop();
	
	return{ 
		Stock : function(items){ 
			return shop.Stock(items);
		} // end Stock
	}; // end return;
}(); // end NormalShop
*/
