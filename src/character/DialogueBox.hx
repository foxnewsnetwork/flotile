package character;
import main.Tile;


class DialogueBox extends Tile {
	private var chats : Array<String>;
	private var speaker : Tile;
	
	public override function Hide( ?cb : Void -> Void ){ 
		super.Hide(cb);
		if( cb == null ){ 
			this.speaker.Hide();
		} // end if
	} //end Hide
	public override function Show( ?cb : Void -> Void ){ 
		super.Show(cb);
		if( cb == null ){ 
			this.speaker.Show();
		} // end if
	} //end Show
	public override function Remove() : Void { 
		super.Remove();
		this.speaker.Remove();
	} // end show
	public function new(){ 
		super();
		this.chats = [];
		this.speaker = new Tile();
		// Modifying css
		this.CSS( "width" , "80%");
		this.CSS( "height" , "35%" );
		this.CSS("position", "absolute");
		this.CSS( "left" , "10%" );
		this.CSS( "top" , "60%" );
		this.CSS( "border", "2px solid black" );
		this.CSS( "background-color" , "rgb(200,198,225)" );
		this.CSS( "opacity" , "0.85" );
		this.CSS( "border-radius" ,"1em" );
		this.CSS( "-moz-border-radius" , "1em" );
		this.CSS( "padding" , "1em" );
		this.CSS( "padding-left" , "2em");
		this.CSS( "padding-right" , "2em" );
		this.CSS("z-index", "950");
		
		this.speaker.Size( { width : 15, height : 3 } );
		this.speaker.Position( { x : 10, y : 52 } );
		this.speaker.CSS( "border", "2px solid black" );
		this.speaker.CSS( "background-color" , "rgb(200,198,225)" );
		this.speaker.CSS( "opacity" , "0.85" );
		this.speaker.CSS( "border-radius" ,"1em" );
		this.speaker.CSS( "-moz-border-radius" , "1em" );
		this.speaker.CSS( "padding" , "0.7em" );
		this.speaker.CSS("z-index", "950");
		this.speaker.CSS("text-align", "center");
		this.speaker.CSS("font-size", "1.75em");
		
	} // end new
	public function Chat(chat : String, ?speaker : String) : Void{ 
		this.chats.push(chat);
		this.HTML("<p></p><p id=\"visual-novel-dialogue\">"+ chat +"</p>");
		if( speaker != null ){ 
			this.speaker.HTML(speaker);
		} //end if
	} // end Chat
	public function Purge() : Void{
		
	} // end Purge
} // end DialogueBox