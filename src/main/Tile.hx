package main;
import js.JQuery;

class Tile extends Element {
	private var image : String;
	private var clicks : Array<JqEvent -> Void>;
	private var mouseovers : Array<JqEvent -> Void>;
	private var mouseleaves : Array<JqEvent -> Void>;
	public function new(){ 
		this.clicks = [];
		this.mouseovers = [];
		this.mouseleaves = [];
		super();
		this.CSS("z-index", "968");
	} // end new
	public function SetAnimation(?image : String) : String{
		if( image == null ){ 
			return this.image;
		} // end if
		this.image = image; 
		this.CSS("background-image", "url('" + image + "')" );
		return this.image;
	} // end SetAnimation
	public function Click( ?cb : JqEvent -> Void ){ 
		if( cb == null ){ 
			for( k in 0...this.clicks.length ){ 
				this.clicks[k](null);
			} //end for
		} //end if
		else{ 
			this.clicks.push(cb);
			this.domContainer.click(cb);
		}// end else
	} // end Click
	public function Mouseover( ?cb : JqEvent -> Void ){
		if( cb == null ){ 
			for( k in 0...this.mouseovers.length ){ 
				this.mouseovers[k](null);
			} //end for
		} //end if
		else{ 
			this.mouseovers.push(cb);
			this.domContainer.mouseover(cb);
		}// end else 
	} //end Mouseover
	public function Mouseleave( ?cb : JqEvent -> Void ){ 
		if( cb == null ){ 
			for( k in 0...this.mouseleaves.length ){ 
				this.mouseleaves[k](null);
			} //end for
		} //end if
		else{ 
			this.mouseleaves.push(cb);
			this.domContainer.mouseleave(cb);
		}// end else
	} //end Mouseleave  
} // end tile