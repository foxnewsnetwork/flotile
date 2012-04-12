package main;
import js.JQuery;

class ConfirmationForm extends ItemForm {
	private var paymentinfo : PaymentInfo;
	
	public function new(itemtile : ItemTile){ 
		super(itemtile);
		this.HTML("<p>Confirm Purchase</p>");
		this.Size({width : 125, height : 125});
		this.Confirm((function(cof : ConfirmationForm){ 
			return function(e : JqEvent){ 
				cof.itemtile.Buy(cof.PaymentInfo());
				cof.Remove();
				Tooltip.hide();
			}; // end return
		})(this));// end Confirm
	} //end new
	public function PaymentInfo( ?paydata : PaymentInfo ){ 
		if( paydata == null ){ 
			return this.paymentinfo;
		} // end if
		this.paymentinfo = paydata;
		return this.paymentinfo;	
	} // end PaymentInfo
} // end ConfirmationForm