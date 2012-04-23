package main;
import js.JQuery;

class Element {
	public static var ID : Int = 0;
	public static var NAME : String = "InGidio-Tile-Element-" + Math.floor(10000 * Math.random()); 
	private var domContainer : JQuery;
	private var domBody : JQuery;
	private var position : { x : Int, y : Int };
	private var size : { width : Int, height : Int };
	private var hides : Array<Void -> Void>;
	private var shows : Array<Void -> Void>;
	private var parent : JQuery; // defaults to body
	private var timer : haxe.Timer;
	
	public static var TestCounter : Int = 0;
	
	public function new(){
		this.hides = [];
		this.shows = []; 
		this.position = { x : 0, y : 0 };
		this.size = { width : 75, height : 75 };
		this.domBody = new JQuery( "body" );
		this.parent = domBody;
		domBody.append("<div id='" + Element.NAME + "-" + Element.ID + "'></div>");
		this.domContainer = new JQuery( "#" + Element.NAME + "-" + Element.ID );
		Element.ID += 1;
		this.CSS("z-index", "967");
		this.CSS("position", "absolute");
		// Setup tracking so that it tracks down its parent every 500 miliseconds
		js.Lib.window.onresize = (function(el : Element){ 
			return function(e){ el.Track(); };
		})(this);
	} // end new
	
	// does tracking
	public function Track() : Void{
		// Step 1: Make sure the parent event exists
		if( this.parent.length < 1 ){ 
			this.Remove();
			return;
		} // end if
		
		// Step 2: Check if the parent is hidden
		// if the parent is hidden, this should be hidden
		// although, if the parent is show doesn't mean this gets show
		if( this.parent.attr("visibility") == "hidden" ){ 
			this.Hide();
		} // end if
		
		// Step 3: Move this to the parent
		this.Position(this.position);
		
		// Step 4: Scale this to match the parent (as necessary)
		var scale : String = this.parent.attr("-moz-transform");
		if( scale != "" ){
			this.CSS("-moz-transform", scale);
		} //end if
	} // end Track
	
	// Set / get the parent; elements follows the parents around
	public function Parent( ?parent : String ) : JQuery{ 
		if( parent == null ){ 
			return this.parent;
		} //end if
		else{ 
			
			// js.Lib.alert(this.parent.length); 
			if( this.parent.length == 0 ){
				
				this.parent = this.domBody;
			} 
			return this.parent;
		} // end else
	} //end parent
	
	// Position is always with respect to the parent
	public function Position( ?pos : { x : Int, y :Int } ) : { x : Int, y : Int }{ 
		Element.TestCounter++;
		if( pos == null ){ 
			return this.position;
		} //end if
		this.position = pos;
		//js.Lib.alert(this.parent.html());
		var offset = { top : this.parent.innerHeight(), left : this.parent.innerWidth() }; 
		//js.Lib.alert(offset);
		var x = this.position.x;
		var y = this.position.y;
		this.domContainer.css("left", x + "%");
		this.domContainer.css("top", y + "%");
		return this.position;
	} // end Position
	
	public function Size( ?siz : { width : Int, height : Int }) : { width : Int, height : Int }{ 
		if( siz == null ){ 
			return this.size;
		} // end if
		this.size = siz;
		this.domContainer.css("width", this.size.width + "%");
		this.domContainer.css("height", this.size.height + "%");
		this.domContainer.css("background-size", "100% 100%");
		return this.size;
	} // end Size
	
	public function Remove() : Void{
		this.Hide();
		this.domContainer.remove();
	}// end remove
	
	public function Hide(?cb : Void -> Void) : Void{ 
		if(cb == null){ 
			this.domContainer.hide(500, (function(element : Element){
				return function(){
					for(k in 0...element.hides.length){
						element.hides[k]();
					} //end for
				}; // end return
			})(this)); // end hide
		} //end if
		else{
			this.hides.push(cb);
		} // end else
	} //end Hide
	
	public function Show(?cb : Void -> Void) : Void{ 
		if(cb == null){ 
			this.domContainer.show(250,(function(element : Element){
				return function(){
					for(k in 0...element.shows.length){
						element.shows[k]();
					} //end for
				}; // end return
			})(this)); // end show
		} //end if
		else{
			this.shows.push(cb);
		} // end else
	} //end show
	
	public function CSS( prop : String, value : String ) : Void{ 
		this.domContainer.css( prop, value );
	} // end CSS
	
	public function HTML( ?html : String ) : String{ 
		if( html == null ){ 
			return this.domContainer.html();
		}//end if
		this.domContainer.removeData();
		this.domContainer.append(html);
		return html;
	} // end HTML
}