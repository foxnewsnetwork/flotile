package main;

class PaymentForm extends Form {
	public static var SPECS_PAYMENTFORM = untyped SPECS_PAYMENTFORM;
	public function new(item : Item){ 
		super(item);
		this.form = untyped InGidioForm.build(PaymentForm.SPECS_PAYMENTFORM);
		this.HTML(this.form);
		this.Confirm((function(item:Item, pay : PaymentForm){
			return function(e){ 
				var confirmation : ConfirmationForm = new ConfirmationForm(item);
				confirmation.Position(pay.Position());
				confirmation.PaymentInfo( pay.Get() );
				pay.Remove();
			}; // end return;
		})(item, this)); //end Confirm
	} //end new
	public function Get(){ 
		var content = untyped InGidioForm.get();
		return content;
	} //end Get
} // end PaymentForm