package main;
import js.JQuery;
import tools.Timer;

class Tile extends Element, implements Statistics{
	private var image : String;
	private var clicks : Array<JqEvent -> Void>;
	private var mouseovers : Array<JqEvent -> Void>;
	private var mouseleaves : Array<JqEvent -> Void>;
	public var stats : { mouseover : Array<Float>, duration : Array<Float>, click : Array<Float> };
	
	public function new(){
		this.ClearStats(); 
		this.clicks = [];
		this.mouseovers = [];
		this.mouseleaves = [];
		
		super();
		this.CSS("z-index", "968");
	} // end new
	public function Stats() : Dynamic { 
		return this.stats; 
	} //end GetStats
	public function ClearStats() : Dynamic{ 
		var tempstats = this.stats;
		this.stats = {mouseover : [], duration : [], click : []};
		return tempstats;
	} //end ClearStats
	public function SetAnimation(?image : String) : String{
		if( image == null ){ 
			return this.image;
		} // end if
		else if( this.image == image ){ 
			return this.image;
		} // end else
		this.image = image; 
		this.CSS("background-image", "url('" + image + "')" );
		return this.image;
	} // end SetAnimation
	public function Click( ?cb : JqEvent -> Void ){ 
		if( cb == null ){ 
			for( k in 0...this.clicks.length ){ 
				this.clicks[k](null);
				this.stats.click.push(haxe.Timer.stamp());
			} //end for
		} //end if
		else{ 
			this.clicks.push(cb);
			this.domContainer.click((function(tile : Tile){
				return function(e : JqEvent){
					tile.Click();
				}; // end return
			})(this)); // end click
		}// end else
	} // end Click
	public function Mouseover( ?cb : JqEvent -> Void ){
		if( cb == null ){ 
			for( k in 0...this.mouseovers.length ){ 
				this.mouseovers[k](null);
				this.stats.mouseover.push(Timer.Start());
			} //end for
		} //end if
		else{ 
			this.mouseovers.push(cb);
			this.domContainer.mouseover((function(tile : Tile){
				return function(e : JqEvent){
					tile.Mouseover();
				}; // end return
			})(this)); // end mouseover;
		}// end else 
	} //end Mouseover
	public function Mouseleave( ?cb : JqEvent -> Void ){ 
		if( cb == null ){ 
			for( k in 0...this.mouseleaves.length ){ 
				this.mouseleaves[k](null);
				this.stats.duration.push(Timer.Stop());
			} //end for
		} //end if
		else{ 
			this.mouseleaves.push(cb);
			this.domContainer.mouseleave((function(tile : Tile){
				return function(e : JqEvent){
					tile.Mouseleave();
				}; // end return
			})(this)); // end mouseleave
		}// end else
	} //end Mouseleave  
} // end tile