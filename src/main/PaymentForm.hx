package main;
import js.JQuery;
class PaymentForm extends ItemForm {
	private var ids : Array<String>;
	
	private var id : String;
	public function new(itemtile : ItemTile){ 
		super(itemtile);
		this.id = "InGidio-PaymentForm-" + Math.floor(Math.random()*50000) + "-";
		this.ids = [];
		this.GenerateForm();
		this.HTML(this.form);
		
		
		this.Size({width : 200, height : 325 });
		this.Confirm((function(itemtile:ItemTile, pay : PaymentForm){
			return function(e){
				if(pay.Validate()){ 
					var confirmation : ConfirmationForm = new ConfirmationForm(itemtile);
					confirmation.Position(pay.Position());
					confirmation.PaymentInfo( pay.Get() );
					pay.Remove();
				} // end if
			}; // end return;
		})(this.itemtile, this)); //end Confirm
	} //end new
	public function Get() : PaymentInfo{ 
		var pay : PaymentInfo = { 
			name : (new JQuery("#" + this.id + this.ids[0]).val()),
			creditcard : (new JQuery("#" + this.id + this.ids[1]).val()),
			ccv : (new JQuery("#" + this.id + this.ids[2]).val()),
			month : (new JQuery("#" + this.id + this.ids[3]).val()),
			year : (new JQuery("#" + this.id + this.ids[4]).val()),
			email : (new JQuery("#" + this.id + this.ids[5]).val())
		};		
		return pay;
	} //end Get
	public function Validate() : Bool{ 
		// Step 0: Declarations
		var flag : Bool = true;
		var rcc;
		var res;
		var jq;
		// Step 0.5: validate name
		rcc = ~/\S+/;
		jq = new JQuery("#" + this.id + this.ids[0]);
		jq.css("border", "none");
		res = rcc.match(jq.val());
		if(!res){ 
			jq.css("border", "2px solid red");
			flag = false;
		} // end if
		
		// Step 1: validate credit card
		rcc = ~/^[0-9]{4}(\s|-){0,}[0-9]{4}(\s|-){0,}[0-9]{4}(\s|-){0,}[0-9]{4}(\s|-){0,}$/;
		jq = new JQuery("#" + this.id + this.ids[1]);
		jq.css("border", "none");
		res = rcc.match(jq.val());
		if(!res){ 
			jq.css("border", "2px solid red");
			flag = false;
		} // end if
		
		// Step 2: validate ccv
		rcc = ~/^[0-9]{3,4}$/;
		jq = new JQuery("#" + this.id + this.ids[2]);
		jq.css("border", "none");
		res = rcc.match(jq.val());
		if(!res){ 
			jq.css("border", "2px solid red");
			flag = false;
		} // end if
		
		// Step 3: validate month
		rcc = ~/^((0?[0-9]{1})|(1[0,2]{1}))$/;
		jq = new JQuery("#" + this.id + this.ids[3]);
		jq.css("border", "none");
		res = rcc.match(jq.val());
		if(!res){ 
			jq.css("border", "2px solid red");
			flag = false;
		} // end if
		
		// Step 4: validate year
		rcc = ~/^((1[2-9]{1})|([2-9]\d))$/;
		jq = new JQuery("#" + this.id + this.ids[4]);
		jq.css("border", "none");
		res = rcc.match(jq.val());
		if(!res){ 
			jq.css("border", "2px solid red");
			flag = false;
		} // end if
		
		// Step 5: validate email
		rcc = ~/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
		jq = new JQuery("#" + this.id + this.ids[5]);
		jq.css("border", "none");
		res = rcc.match(jq.val());
		if(!res){ 
			jq.css("border", "2px solid red");
			flag = false;
		} // end if
		
		return flag;
	} // end Validate
	private function GenerateForm() : String{ 
		var output : String = "<ul style='list-style-type: none; display: inline;'><li>"; 
		output += "<div id='" + this.id + "title'>Checkout</div>";
		output += "</li><li>";
		// Step 1: Name
		output += "<div id='" + this.id + "name-label'>Name: </div>";
		output += "<input type='text' id='" + this.id + "name' placeholder='Adam Smith'/>";
		output += "</li><li>";
		this.ids.push("name");
		// Step 2: Credit Card Number
		output += "<div id='" + this.id + "credit-card-label'>Credit Card Number: </div>";
		output += "<input type='text' id='" + this.id + "credit-card' placeholder='4231 4585 4874 5150'/>";
		output += "</li><li>";
		this.ids.push("credit-card");
		// Step 3: CCV
		output += "<div id='" + this.id + "ccv-label'>CCV: </div>";
		output += "<input type='text' id='" + this.id + "ccv' placeholder='112' style='width: 3em;' size='30'/>";
		output += "</li><li>";
		this.ids.push("ccv");
		// Step 4: Expiration Month
		output += "<div id='" + this.id + "month-label'>Expiration: </div>";
		output += "<input type='text' id='" + this.id + "month' placeholder='3' style='width: 2em;' size='30' />";
		this.ids.push("month");
		// Step 5: Expiration Year
		output += "/20";
		output += "<input type='text' id='" + this.id + "year' placeholder='15' style='width: 2em;' size='30' />";
		output += "</li><li>";
		this.ids.push("year");
		// Step 6: Email
		output += "<div id='" + this.id + "email-label'>Email: </div>";
		output += "<input type='text' id='" + this.id + "email' placeholder='invisible@hand.com'/>";
		output += "</li></ul>";
		this.ids.push("email");
		// Step 7: Return
		this.form = output;
		return output;
	} //end GenerateForm
} // end PaymentForm