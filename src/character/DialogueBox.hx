package character;
import main.Tile;
import tools.TextToolbar;

class DialogueBox extends TextToolbar {
	private var chats : Array<String>;
	private var speakers : Array<String>;
	private var speaker : Tile;
	private var editmode : Bool;
	
	public override function EnterEditMode(positioncb : { x : Float, y : Float } -> Void, sizecb : { width : Float, height : Float } -> Void) : Void{ 
		this.editmode = true;
		this.chatbox.Show();
		this.nametag.Show();
		this.toolbar.Show();
	} // end EnterFlagMode
	
	
	public override function Hide( ?cb : Void -> Void ){ 
		super.Hide(cb);
		this.speaker.Hide(cb);
		if( cb == null ){ 
			this.speaker.Hide();
		} // end if
	} //end Hide
	public override function Show( ?cb : Void -> Void ){ 
		super.Show(cb);
		this.speaker.Show(cb);
		if( cb == null ){ 
			this.speaker.Show();
		} // end if
	} //end Show
	public override function Remove() : Void { 
		super.Remove();
		this.speaker.Remove();
	} // end show
	public function Load( scenes : Array<SceneData> ){ 
		this.chats = [];
		this.speakers = [];
		for( k in 0...scenes.length ) { 
			this.chats.push( scenes[k].text.content );
			this.speakers.push( scenes[k].text.speaker );
		} // end for
	} // end Load
	public function new(){ 
		super();
		this.chats = [];
		this.speakers = [];
		this.speaker = new Tile();
		
		// Modifying css
		this.CSS( "width" , "80%");
		this.CSS( "height" , "35%" );
		this.CSS("position", "absolute");
		this.CSS( "left" , "7%" );
		this.CSS( "top" , "59%" );
		this.CSS( "border", "2px solid black" );
		this.CSS( "background-color" , "rgb(200,198,225)" );
		this.CSS( "opacity" , "0.85" );
		this.CSS( "border-radius" ,"1em" );
		this.CSS( "-moz-border-radius" , "1em" );
		this.CSS( "padding" , "1em" );
		this.CSS( "padding-left" , "2em");
		this.CSS( "padding-right" , "2em" );
		this.CSS("z-index", "950");
		
		this.chatbox.CSS( "width" , "80%");
		this.chatbox.CSS( "height" , "35%" );
		this.chatbox.CSS("position", "absolute");
		this.chatbox.CSS( "left" , "7%" );
		this.chatbox.CSS( "top" , "59%" );
		this.chatbox.CSS( "border", "2px solid black" );
		this.chatbox.CSS( "background-color" , "rgb(200,198,225)" );
		this.chatbox.CSS( "opacity" , "0.85" );
		this.chatbox.CSS( "border-radius" ,"1em" );
		this.chatbox.CSS( "-moz-border-radius" , "1em" );
		this.chatbox.CSS( "padding" , "1em" );
		this.chatbox.CSS( "padding-left" , "2em");
		this.chatbox.CSS( "padding-right" , "2em" );
		this.chatbox.CSS("z-index", "950");
		
		this.speaker.Size( { width : 15.0, height : 3.0 } );
		this.speaker.Position( { x : 7.0, y : 50.0 } );
		this.speaker.CSS( "border", "2px solid black" );
		this.speaker.CSS( "background-color" , "rgb(200,198,225)" );
		this.speaker.CSS( "opacity" , "0.85" );
		this.speaker.CSS( "border-radius" ,"1em" );
		this.speaker.CSS( "-moz-border-radius" , "1em" );
		this.speaker.CSS( "padding" , "0.7em" );
		this.speaker.CSS("z-index", "950");
		this.speaker.CSS("text-align", "center");
		this.speaker.CSS("font-size", "1.75em");
		
		this.nametag.Size( { width : 15.0, height : 3.0 } );
		this.nametag.Position( { x : 7.0, y : 50.0 } );
		this.nametag.CSS( "border", "2px solid black" );
		this.nametag.CSS( "background-color" , "rgb(200,198,225)" );
		this.nametag.CSS( "opacity" , "0.85" );
		this.nametag.CSS( "border-radius" ,"1em" );
		this.nametag.CSS( "-moz-border-radius" , "1em" );
		this.nametag.CSS( "padding" , "0.7em" );
		this.nametag.CSS("z-index", "951");
		this.nametag.CSS("text-align", "center");
		this.nametag.CSS("font-size", "1.75em");
		
		this.toolbar.Position( { x : 27.5, y : 50.2 } );
		this.toolbar.Size({ width : 55.0 , height : 8.5 }) ;
		this.toolbar.CSS( "background-color" , "rgb(200,198,225)" );
		this.toolbar.CSS( "border-radius" ,"1.5em" );
		this.toolbar.CSS( "-moz-border-radius" , "1.5em" );
		this.toolbar.CSS( "opacity" , "0.85" );	
		this.toolbar.CSS( "padding-left", "2em" );
		this.toolbar.CSS( "padding-right", "1.5em" );
		
		
		this.editmode = false;
		this.chatbox.Hide();
		this.nametag.Hide();
		this.toolbar.Hide();
	} // end new
	public function Chat(num : Int) : Void{ 
		this.HTML("<p></p><p class=\"visual-novel-dialogue\">"+ this.chats[num] +"</p>");
		this.speaker.HTML(this.speakers[num]);
		if (this.editmode) { 
			this.Text("<p></p><p class=\"visual-novel-dialogue\">"+ this.chats[num] +"</p>");
			this.Speaker(this.speakers[num]);
		} // end if
	} // end Chat
	
	
	public function Purge() : Void{
		
	} // end Purge
} // end DialogueBox