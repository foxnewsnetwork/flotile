package character;
import tools.VerticalBar;
import tools.Toolbar;
import tools.TextToolbar;
import main.Tile;
import js.JQuery;

class VisualNovelEditor extends VisualNovel {
	private var stock : VerticalBar;
	private var layer : VerticalBar;
	
	public function SetUI( options : { row : Int, col : Int, num : Int, images : String, callbacks : JqEvent -> Void } ) { 
		// stock
		if ( options.num == 0 ) { 
			this.stock.SetIcon({ row : options.row, col : options.col, image : options.images });
			this.stock.SetClick({ row : options.row, col : options.col, func : options.callbacks });
		} // end if
		
		// layer
		else if ( options.num == 1 ) { 
			this.layer.SetIcon({ row : options.row, col : options.col, image : options.images });
			this.layer.SetClick({ row : options.row, col : options.col, func : options.callbacks });
		} // end else if
		
		// dialogue
		else if (options.num == 2 ) { 
			this.dialogue.SetIcon({ row : options.row, col : options.col, image : options.images });
			this.dialogue.SetClick({ row : options.row, col : options.col, func : options.callbacks });
		} // end else if
	} // end SetUI
	
	public function new() { 
		super();
		this.stock = new VerticalBar( );
		this.layer = new VerticalBar( );
		
		this.stock.Position({ x : 0.0, y : 15.0 } );
		this.stock.Size( { width : 4.0, height : 80.0 } );
		
		this.layer.Position({ x : 95.5, y : 15.0 } );
		this.layer.Size( { width : 4.0, height : 80.0 } );
	} // end new
	
	public override function EnterEditMode(positioncb : { x : Float, y : Float } -> Void, sizecb : { width : Float, height : Float } -> Void) : Void { 
		for ( k in 0...this.scenes.length ) { 
			this.scenes[k].EnterEditMode(positioncb, sizecb);
		} // end for
		this.dialogue.EnterEditMode(positioncb, sizecb);
	} // end EnterEditMode
	
	public function Keypress(func : JqEvent -> Void) { 
		this.dialogue.Keypress(func);
	} // end Keypress
	
	public function GetState() : SceneData {
		var data : SceneData = {
			background : { 
				image : this.Scene().Background().SetAnimation()
			} ,
			foreground : { 
				images : [] ,
				positions : [] ,
				sizes : []
			} ,
			text : { 
				content :  this.dialogue.Text(),
				speaker : this.dialogue.Speaker()
			}
		}; // end data
		for ( k in 0...this.Scene().Characters().length ) { 
			var character = this.Scene().Characters()[k];
			data.foreground.images.push(character.SetAnimation());
			data.foreground.positions.push(character.Position());
			data.foreground.sizes.push(character.Size());
		} // end for
		return data;
	} // end GetState
	
	public static function main(){ 
		var FUCKINGNIGGERS : String = "j23i2j";	
		
	} // end main
}// end class