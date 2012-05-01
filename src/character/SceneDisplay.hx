package character;
import main.Tile;
import js.JQuery;

class SceneDisplay extends Tile {
	private var characters : Array<CharacterDisplay>;
	private var background : BackgroundDisplay;
	
	public override function EnterEditMode(positioncb : { x : Float, y : Float } -> Void, sizecb : { width : Float, height : Float } -> Void) : Void {
		for( k in 0...this.characters.length ) { 
			this.characters[k].EnterEditMode(positioncb, sizecb);
		} // end for 
	} // end EnterEditMode
	public function new(){ 
		this.characters = [];
		this.background = new BackgroundDisplay();
		super();
	} // end new
	
	public function Characters() : Array<CharacterDisplay> { 
		return this.characters;
	} // end Characters
	
	public override function Remove() : Void{ 
		super.Remove();
		this.background.Remove();
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
		} // end if
	} //end hide
	
	public override function Show(?cb : Void -> Void) : Void{ 
		super.Show(cb);
		if ( cb == null ) { 
			this.background.Show();
			for( k in 0...this.characters.length ){ 
				this.characters[k].Show();
			} // end for
		} // end if
	} //end hide
	
	public override function Click(?cb : JqEvent -> Void) : Void {
		// TODO: implement me!
	} //end Next
	
	public function Background(){ 
		return this.background;
	} // end KillBackground 
	
	public function Transition() : Void { 
		// TODO: write in actual animation 
		this.Hide();
		this.Show();
	} // end transition
	
	public function Load( scene : SceneData ){ 
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
					this.characters[k].Hide();
				} //end for
			} //end if
		} //end if
	} // end load
} // end SceneDisplay