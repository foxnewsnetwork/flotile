package tools;
import js.JQuery;
import main.InputTile;
import main.Tile;

class TextToolbar extends Tile {
	private var chatbox : InputTile;
	private var nametag : InputTile;
	private var toolbar : Toolbar;
	
	public function new() { 
		super();
		this.chatbox = new InputTile();
		this.nametag = new InputTile();
		this.toolbar = new Toolbar( { rows : 1, columns : 4 } );
		this.chatbox.Size( { width : 65.0, height : 35.0 } );
		this.nametag.Size( { width : 10.0, height : 6.0 } );
		this.toolbar.Size( { width : 54.0, height : 6.0 } ); 
	} // end new
	
	public override function Position( ?pos : { x : Float, y : Float } ) : { x : Float, y : Float } { 
		this.nametag.Position(pos);
		this.toolbar.Position({ x : pos.x + this.nametag.Size().width, y : pos.y});
		this.chatbox.Position({ x : pos.x, y : pos.x + this.toolbar.Size().height });
		return super.Position(pos);
	} // end Position
	
	public function Keypress( ?func : JqEvent -> Void ) { 
		this.chatbox.Keypress(func);
	} // end Keystroke
	
	public function Keydown( ?func : JqEvent -> Void ) { 
		this.chatbox.Keydown( func );
	} // end Keystroke  
	
	public function Keyup( ?func : JqEvent -> Void ) { 
		this.chatbox.Keyup( func );
	} // end Keystroke  
	
	public function Text( ?txt : String ) : String { 
		return this.chatbox.Text(txt);
	} // end Text
	
	public function Speaker( ?txt : String ) : String { 
		return this.nametag.Text(txt);
	} // end speaker
	
	public override function Size( ?siz : { width : Float, height : Float } ) : { width : Float, height : Float } { 
		if ( siz == null ) {  
			return super.Size(siz);
		} // end if
		var size0 = this.Size();
		var xrat = siz.width / size0.width;
		var yrat = siz.height / size0.height;
		
		this.chatbox.Size({width : this.chatbox.Size().width * xrat, height : this.chatbox.Size().height * yrat});
		this.nametag.Size({width : this.nametag.Size().width * xrat, height : this.nametag.Size().height * yrat});
		this.toolbar.Size({width : this.toolbar.Size().width * xrat, height : this.toolbar.Size().height * yrat});
		return super.Size(siz);
	} // end Position
	
	public function SetIcon( options : { image : String, row : Int, col : Int } ) { 
		this.toolbar.SetIcon( options );
	} // return Set
	
	public function SetMouseover( options : { func : JqEvent -> Void, row : Int, col : Int } ) { 
		this.toolbar.SetMouseover( options );
	} // end setmouseover 
	
	public function SetMouseleave( options : { func : JqEvent -> Void, row : Int, col : Int } ) { 
		this.toolbar.SetMouseleave( options );
	} // end setmouseleave
	
	public function SetClick( options : { func : JqEvent -> Void, row : Int, col : Int } ) { 
		this.toolbar.SetClick( options );
	} // end setmouseleave
} // end TextToolbar