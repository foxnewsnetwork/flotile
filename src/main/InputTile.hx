package main;
import js.JQuery;

class InputTile extends Tile {
	private var input : JQuery;
	
	public function new() { 
		super();
		this.domContainer.append("<textarea type='text' id='" + Element.NAME + "-" + Element.ID + "-type-INPUT' />");
		this.input = new JQuery("#" + Element.NAME + "-" + Element.ID + "-type-INPUT");
		this.input.css("width", "100%" );
		this.input.css("height", "100%" );
	} // end new
	
	public function Keypress( ?func : JqEvent -> Void ) { 
		this.input.keypress( func );
	} // end Keystroke
	
	public function Keydown( ?func : JqEvent -> Void ) { 
		this.input.keydown( func );
	} // end Keystroke  
	
	public function Keyup( ?func : JqEvent -> Void ) { 
		this.input.keyup( func );
	} // end Keystroke  
	
	public function Text( ?txt : String ) : String { 
		if( txt == null ) { 
			return this.input.val();
		} // end if
		else { 
			this.input.html(txt);
			return this.input.val();
		} // end else
	} // end Text 
} // end InputTile