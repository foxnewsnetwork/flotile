package character;
import main.Tile;

class DialogueBox extends Tile {
	private var chats : Array<String>;
	private var speaker : Tile;
	
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
		this.CSS( "opacity" , "0.65" );
		this.CSS( "border-radius" ,"1em" );
		this.CSS( "-moz-border-radius" , "1em" );
		this.CSS( "padding" , "1em" );
		this.CSS("z-index", "950");
		
		this.speaker.Size( { width : 15, height : 3 } );
		this.speaker.Position( { x : 10, y : 53 } );
		this.speaker.CSS( "border", "2px solid black" );
		this.speaker.CSS( "background-color" , "rgb(200,198,225)" );
		this.speaker.CSS( "opacity" , "0.65" );
		this.speaker.CSS( "border-radius" ,"1em" );
		this.speaker.CSS( "-moz-border-radius" , "1em" );
		this.speaker.CSS( "padding" , "0.7em" );
		this.speaker.CSS("z-index", "950");
		this.speaker.CSS("text-align", "center");
	} // end new
	public function Chat(chat : String, ?speaker : String) : Void{ 
		this.chats.push(chat);
		this.HTML("<p>"+ chat +"</p>");
		if( speaker != null ){ 
			this.speaker.HTML(speaker);
		} //end if
	} // end Chat
	public function Purge() : Void{
		 
	} // end Purge
} // end DialogueBox