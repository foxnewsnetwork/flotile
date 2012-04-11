package main;
import js.JQuery;
// Wrapper class for the form
class Form extends Element{
	public static var IMAGES = untyped { yes : SHOP_IMAGE_APPROVE, no : SHOP_IMAGE_CANCEL };
	public static var FORMS : Array<Form> = [];
	private var form : String;
	private var yes : Tile;
	private var no : Tile;
	private var item : Item;
	
	public static function RemoveAll() : Void{ 
		for( k in 0...Form.FORMS.length ){ 
			Form.FORMS.pop().Remove();
		} //end for
	} //end RemoveAll
	override public function Position( ?pos : { x : Int, y : Int } ) : { x : Int, y : Int } { 
		if(pos == null){
			return super.Position();
		} // end if
		super.Position(pos);
		var size = this.Size();
		this.yes.Position({
			x : this.Position().x + 10 , y : pos.y + this.Size().height - this.yes.Size().height - 10
		});
		this.no.Position({
			x : this.Position().x + this.Size().width - this.no.Size().width , y : pos.y + this.Size().height - this.yes.Size().height - 10
		});
		return super.Position();
	} // end move
	public function Confirm( ?cb : JqEvent -> Void ){ 
		this.yes.Click(cb);
	} // end Confirm
	public function Cancel( ?cb : JqEvent -> Void ){ 
		this.no.Click(cb);
		if( cb == null ){ 
			this.Remove();
		} //end if
	} // end Cancel
	public function new(it : Item){ 
		super();
		this.item = it;
		this.yes = new Tile();
		this.no = new Tile();
		this.CSS("border-radius", "10px");
		this.CSS("-moz-border-radius", "10px");
		this.CSS("border", "2px solid red");
		this.CSS("padding-left", "0.5em");
		this.yes.CSS("border", "2px solid black");
		this.no.CSS("border", "2px solid black");
		this.yes.CSS("border-radius", "10px");
		this.yes.CSS("-moz-border-radius", "10px");
		this.no.CSS("border-radius", "10px");
		this.no.CSS("-moz-border-radius", "10px");
		this.yes.Size({width : 50, height : 50 });
		this.no.Size({width : 50, height : 50 });
		this.yes.SetAnimation(Form.IMAGES.yes);
		this.no.SetAnimation(Form.IMAGES.no);
		this.yes.Mouseover(function(e : JqEvent){ 
			Tooltip.show("Confirm");
		});
		this.yes.Mouseleave(function(e : JqEvent){
			Tooltip.hide();
		});
		this.no.Mouseover(function(e : JqEvent){ 
			Tooltip.show("Cancel");
		});
		this.no.Mouseleave(function(e : JqEvent){
			Tooltip.hide();
		});
		this.no.Click((function(myform : Form){
			return function(e : JqEvent){ 
				myform.Remove();
			}; //end return
		})(this)); // end Click
		Form.FORMS.push(this);
	} //end new
	override public function Remove() : Void { 
		this.no.Remove();
		this.yes.Remove();
		super.Remove();
	} // end destroy
}