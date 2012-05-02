package character;
import main.Tile;
import main.Tooltip;
import js.JQuery;

class VisualNovel extends Tile {
	private var dialogue : DialogueBox;
	private var scenes : Array<SceneDisplay>;
	private var count : Int;
	private var ui : Array<Tile>;
	private var loading : LoadingDisplay;
	private var ending : Array<Void -> Void>;
	
	public function new(){ 
		super();
		this.dialogue = new DialogueBox();
		this.ending = [];
		this.scenes = [];
		this.count = 0;
		this.ui = [];
		this.ui.push(new Tile());
		this.loading = new LoadingDisplay();
		this.loading.HTML("<h1>Now Loading...</h1>");
		this.ui[0].CSS("background-color" , "rgb(200,198,225)" );
		this.ui[0].Mouseover( function(e : JqEvent){
			Tooltip.show("Next");
		} ); // end MouseOver
		this.ui[0].Mouseleave( function(e : JqEvent){ 
			Tooltip.hide();
		} ); // end Mouseleave
		this.ui[0].CSS("z-index", "998");
		this.ui[0].CSS( "opacity" , "0.75" );
		this.ui[0].CSS("border","2px solid black");
		this.ui[0].CSS("border-radius", "1em");
		this.ui[0].CSS( "-moz-border-radius" , "1em" );
		this.ui[0].Size({ width : 4.0, height : 4.0});
		this.ui[0].Position({ x : 87.5, y : 53.0 });
		this.ui[0].CSS("text-align", "center");
		this.ui[0].HTML(">>>");
	} // end new
	
	public override function Show(?cb : Void -> Void ) : Void { 
		if( cb != null ) { 
			super.Show(cb);
		} // end if
		else {
			this.scenes[this.count].Show();
			for( j in 0...this.ui.length ) { 
				this.ui[j].Show();
			} // end for
			this.dialogue.Show();
		} // end else
	} // end Show
	
	public override function Hide(?cb : Void -> Void ) : Void { 
		if( cb != null ) { 
			super.Hide(cb);
		} // end if
		else {
			for( k in 0...this.scenes.length ) { 
				this.scenes[k].Hide();
			} // end for
			for( j in 0...this.ui.length ) { 
				this.ui[j].Hide();
			} // end for
			this.dialogue.Hide();
		} // end else
	} // end Hide
	
	public function Load( scenes : Array<SceneData> ) : Void{ 
		this.KillScenes();
		this.LoadingScreen(true);
		this.scenes = [];
		this.dialogue.Hide();
		this.dialogue.Load(scenes);
		for( k in 0...scenes.length ){ 
			this.scenes.push( new SceneDisplay() );
			this.scenes[k].Hide();
			this.scenes[k].Load( scenes[k] );
		} // end for	
		this.count = 0;
		this.LoadingScreen(false);
		this.dialogue.Show();
	} // end Load
	
	public function Scene( ?num : Int ) : SceneDisplay { 
		if( num == null ){ 
			return this.scenes[this.count];
		} // end if
		else { 
			this.scenes[this.count].Hide();
			this.count = num;
			this.dialogue.Chat(num);
			this.scenes[this.count].Show();
			return this.scenes[this.count];
		} // end else
	} // end Scene
	
	public function LoadingDisplay() : LoadingDisplay { 
		return this.loading;
	} // end LoadingDisplay
	public function LoadingScreen( ?flag : Bool ) : Void { 
		if( flag ) { 
			this.loading.Show();
		} // end if
		else { 
			this.loading.Hide();
		} // end else
	} // end LoadingScreen
	
	public override function Remove() : Void { 
		this.KillScenes();
		this.dialogue.Remove();
		for( k in 0...this.ui.length ){ 
			this.ui[k].Remove();
		} // end for
		super.Remove();
	} // end Remove
	
	public function End( ?cb : Void -> Void ){ 
		if( cb == null ) { 
			for( k in 0...this.ending.length ){ 
				this.ending[k]();
			} // end for
		} // end if
		else { 
			this.ending.push(cb);
		} // end else
	} // end End
	
	public function Next() : SceneDisplay { 
		this.scenes[this.count].Hide();
		this.count++;
		if(this.count >= this.scenes.length){ 
			this.count--;
			this.End();
			return this.scenes[this.count];
		} // end if
		else {
			this.dialogue.Chat(this.count);  
			this.scenes[this.count].Show();
			return this.scenes[this.count];
		} // end else
	} // end Next
	
	public function Previous() : SceneDisplay { 
		this.scenes[this.count].Hide();
		this.count--;
		this.count = this.count < 0 ? 0 : this.count;
		this.dialogue.Chat(this.count);
		this.scenes[this.count].Show();
		return this.scenes[this.count];
	} // end Previous
	
	public function KillScenes() : Void { 
		for( k in 0...this.scenes.length ){ 
			this.scenes[k].Remove();
		} // end for
		this.scenes = [];
	} // end Remove
	
	public override function Click( ?cb : JqEvent -> Void ) : Void { 
		if( cb != null ) {
			this.dialogue.Click(cb);
			this.ui[0].Click(cb);
		} // end if
		else { 
			this.dialogue.Click(cb);
		} // end else
	} // end Click
	
} // end Visual Novel