package character;
import main.Tile;
import main.Tooltip;
import js.JQuery;

class VisualNovel extends Tile {
	private var dialogue : DialogueBox;
	private var characters : Array<CharacterDisplay>;
	private var background : BackgroundDisplay;
	private var ui_next : Tile;
	
	public function new(){ 
		this.ui_next = new Tile();
		
		this.ui_next.CSS("background-color" , "rgb(200,198,225)" );
		this.ui_next.Mouseover( function(e : JqEvent){
			Tooltip.show("Next");
		} ); // end MouseOver
		this.ui_next.Mouseleave( function(e : JqEvent){ 
			Tooltip.hide();
		} ); // end Mouseleave
		this.ui_next.CSS("z-index", "998");
		this.ui_next.CSS( "opacity" , "0.65" );
		this.ui_next.CSS("border","2px solid black");
		this.ui_next.CSS("border-radius", "1em");
		this.ui_next.CSS( "-moz-border-radius" , "1em" );
		this.ui_next.Size({ width : 4, height : 4});
		this.ui_next.Position({ x : 90, y : 55 });
		this.ui_next.CSS("text-align", "center");
		this.ui_next.HTML(">>>");
		this.dialogue = new DialogueBox();
		this.characters = [];
		this.background = new BackgroundDisplay();
		super();
	} // end new
	
	public override function Remove() : Void{ 
		super.Remove();
		this.background.Remove();
		this.ui_next.Remove();
		for( k in 0...this.characters.length ){ 
			this.characters[k].Remove();
		} //end for
	} //end remove
	
	public override function Hide(?cb : Void -> Void) : Void{ 
		super.Hide(cb);
		if( cb == null ){
			this.background.Hide();
			for( k in 0...this.characters.length ){ 
				this.characters[k].Hide();
			} // end for
			this.ui_next.Hide();
		} // end if
	} //end hide
	
	public override function Show(?cb : Void -> Void) : Void{ 
		super.Show(cb);
		if ( cb == null ) { 
			this.dialogue.Show();
			this.background.Show();
			for( k in 0...this.characters.length ){ 
				this.characters[k].Show();
			} // end for
			this.ui_next.Show();
		} // end if
	} //end hide
	
	public function Next(?cb : JqEvent -> Void) : Void {
		this.ui_next.Click(cb);
	} //end Next
	
	public function Background(){ 
		return this.background;
	} // end KillBackground 
	
	public function PlayScene( scene : SceneData ){ 
		// Step 1: Set background
		if( scene.background != null ){ 
			if( scene.background.image != null ){
				this.background.SetAnimation(scene.background.image);
				this.background.CSS("z-index", "850");
			} // end if
		} //end if
		else { 
			this.background.Hide();
		} //end else 
		
		// Step 2: Set foreground
		if ( scene.foreground != null ){
			for( k in 0...this.characters.length ){ 
				this.characters[k].Remove();
			} // ned for
			this.characters = []; 
			if ( scene.foreground.images != null ) { 
				for( k in 0...scene.foreground.images.length ){ 
					this.characters.push( new CharacterDisplay() );
					this.characters[k].SetAnimation(scene.foreground.images[k]);
					this.characters[k].Position(scene.foreground.positions[k]);
					this.characters[k].Size(scene.foreground.sizes[k]);
					this.characters[k].CSS("z-index", (850 + k) + "");
				} //end for
			} //end if
		} //end if
		
		// Step 3: Set text
		if (scene.text != null) { 
			if ( scene.text.speaker != null ) { 
				this.dialogue.Chat(scene.text.content, scene.text.speaker);
				this.dialogue.CSS("z-index", "950");
			} //end if
		} // end if
	} // end load
	public static function main(){ 
		var FUCKINGNIGGERS : String = "j23i2j";
		
	} // end main
} // end Visual Novel