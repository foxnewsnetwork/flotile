package character;
import main.Tile;

class VisualNovel extends Tile {
	private var dialogue : DialogueBox;
	private var characters : Array<CharacterDisplay>;
	private var background : BackgroundDisplay;
	
	public function new(){ 
		this.dialogue = new DialogueBox();
		this.characters = [];
		this.background = new BackgroundDisplay();
		super();
	} // end new
	
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
		
		// Step 2: Set foreground
		if ( scene.foreground != null ){
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
		var ASSHOLES = new VisualNovel();
	} // end main
} // end Visual Novel