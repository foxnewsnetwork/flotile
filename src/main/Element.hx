package main;
import js.JQuery;

class Element {
	public static var ID : Int = 0;
	public static var NAME : String = "InGidio-Tile-Element-" + Math.floor(10000 * Math.random()); 
	private var domContainer : JQuery;
	private var position : { x : Int, y : Int };
	private var size : { width : Int, height : Int };
	private var hides : Array<Void -> Void>;
	private var shows : Array<Void -> Void>;
	
	public function new(){
		this.hides = [];
		this.shows = []; 
		this.position = { x : 0, y : 0 };
		this.size = { width : 75, height : 75 };
		var domBody = new JQuery( "body" );
		domBody.append("<div id='" + Element.NAME + "-" + Element.ID + "'></div>");
		this.domContainer = new JQuery( "#" + Element.NAME + "-" + Element.ID );
		Element.ID += 1;
		this.CSS("z-index", "967");
		this.CSS("position", "absolute");
	} // end new
	
	public function Position( ?pos : { x : Int, y :Int } ) : { x : Int, y : Int }{ 
		if( pos == null ){ 
			return this.position;
		} //end if
		this.position = pos;
		this.domContainer.css("left", this.position.x  + "px");
		this.domContainer.css("top", this.position.y + "px");
		return this.position;
	} // end Position
	
	public function Size( ?siz : { width : Int, height : Int }) : { width : Int, height : Int }{ 
		if( siz == null ){ 
			return this.size;
		} // end if
		this.size = siz;
		this.domContainer.css("width", this.size.width + "px");
		this.domContainer.css("height", this.size.height + "px");
		this.domContainer.css("background-size", this.size.width + "px " + this.size.height + "px");
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
		this.domContainer.append(html);
		return html;
	} // end HTML
}