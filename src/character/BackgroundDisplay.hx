package character;
import main.Tile;

class BackgroundDisplay extends Tile {
	public function new() { 
		super();
		this.Size({ width : 100, height : 100 });
		this.Position({x : 0, y : 0});
	} // end new
	public override function Show( ?cb : Void -> Void ){ 
		if( this.image == null ){ 
			return;
		} // end if
		super.Show(cb);
	} // end Show
} // end Tile