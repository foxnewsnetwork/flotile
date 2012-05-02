package main;
import js.JQuery;
import tools.Timer;

class Tile extends Element, implements Statistics{
	private var image : String;
	private var clicks : Array<JqEvent -> Void>;
	private var mouseovers : Array<JqEvent -> Void>;
	private var mouseleaves : Array<JqEvent -> Void>;
	public var stats : { mouseover : Array<Float>, duration : Array<Float>, click : Array<Float> };
	
	public function EnterEditMode( positioncb : { x : Float, y : Float } -> Void, sizecb : { width : Float, height : Float } -> Void ) : Void { 
		// Step 1: Manage mouseover and mouse leave UI
		this.Mouseover( function(e : JqEvent) { 
			
			this.CSS("border", "2px solid blue");
		} ); // end MouseOver
		this.Mouseleave(function(e : JqEvent) { 
			
			this.CSS("border", "none");
		} ); // end mouseleave
		
		// Step 2: Manage click-drag ui
		var mousedownflag = false, xdiff = 0.0, ydiff = 0.0;
		this.domContainer.mousedown(function(e:JqEvent){
			mousedownflag = true; 
			var body = this.domBody;
			var mx = 100 * e.pageX / body.width();
			var my = 100 * e.pageY / body.height();
			xdiff = mx - this.position.x;
			ydiff = my - this.position.y;
		} ); // end mousedown
		
		this.domContainer.mousemove(function(e:JqEvent){ 
			if (mousedownflag) {
				var dx = xdiff, dy = ydiff;
				var document = this.domBody; 
				var mouseX = 100 * e.pageX / document.width();
				var mouseY = 100 * e.pageY / document.height();
				
				this.Position({ x : mouseX - dx, y : mouseY - dy }); // end position
			} // end if
			return;
		} ); //end mousemove
		this.domContainer.mouseup(function(e:JqEvent){
			positioncb( this.Position() ); 
			mousedownflag = false;
		} ); // end mouseup
		
		// Step 3: Inject resize icon
		// TODO: write me!
		// Step 4: Manage drag-resize ui 
		// TODO: write me!
	} // end EnterEditMode
		
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