package character;
import main.Tile;
import main.Tooltip;
import js.JQuery;

class LoadingDisplay extends Tile {
	public function new(){ 
		super();
		this.Position( { x : 40.0, y : 40.0} );
		this.Size( { width : 25.0, height : 25.0 } );
		this.Mouseover( function(e : JqEvent){ Tooltip.show("Still Loading, buddy"); } );
		this.Mouseleave( function(e : JqEvent){ Tooltip.hide(); } );
	} // end new
} // end LoadingDisplay