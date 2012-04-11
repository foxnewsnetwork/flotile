package main;
import js.JQuery;

class ConfirmationForm extends Form {
	private var paymentinfo : Dynamic;
	
	public function new(item : Item){ 
		super(item);
		this.HTML("<p>Confirm Purchase</p>");
		this.Confirm((function(cof : ConfirmationForm){ 
			return function(e : JqEvent){ 
				untyped InGidio.cashier.Checkout( { item : item, payment : cof.paymentinfo } );
				cof.Remove();
			}; // end return
		})(this));// end Confirm
	} //end new
	public function PaymentInfo( ?paydata ){ 
		if( paydata == null ){ 
			return this.paymentinfo;
		} // end if
		this.paymentinfo = paydata;
		return this.paymentinfo;	
	} // end PaymentInfo
} // end ConfirmationForm