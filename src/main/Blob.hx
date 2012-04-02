package main;
// Blobs are generic tile-based animation extensions
// of the average dom element
import js.JQuery;

class Blob {
	// static id
	public static var id : Int = 0;
	public static var tagname : String = "inGidio-blobform-" + Math.round(Math.random()*1000); 
	// The container
	private var domContainer : JQuery;
	// The group
	private var domGroup : JQuery;
	// The sprites in the group
	private var domSprites : JQuery;
	// The css specifications
	private var domSpecs : main.Specs;
		
	public function new(?spec : main.Specs){ 
		var domBody = new JQuery( "body" );
		domBody.append("<div id='" + Blob.tagname + "-container-" + Blob.id + "'></div>");
		this.domContainer = new JQuery( "#" + Blob.tagname + "-container-" + Blob.id );
		this.domContainer.append("<div id='" + Blob.tagname + "-group-" + Blob.id + "'></div>");
		this.domGroup = new JQuery( "#" + Blob.tagname + "-group-" + Blob.id );
		this.domGroup.append("<div id='" + Blob.tagname + "-sprites-" + Blob.id + "'></div>");
		this.domSprites = new JQuery( "#" + Blob.tagname + "-sprites-" + Blob.id );
		Blob.id++; 
		
		// Setting default css
		this.domContainer.css( "position", "absolute" );
		this.domContainer.css( "width", "75px" );
		this.domContainer.css( "height", "75px" );
		this.domGroup.css( "width", "75px" );
		this.domGroup.css( "height", "75px" );
		this.domSprites.css( "background-size", "75px 75px" );
		this.domSprites.css( "background-repeat", "no-repeat" );
		this.domSprites.css( "z-index", "975" );
		this.domGroup.css( "z-index", "970" );
		this.domContainer.css( "z-index", "965" );
		
		// Setting the specifications
		if( spec != null ){ 
			for( a in 0...spec.Length() ){ 
				var data = spec.get(a);
				this.domContainer.css( data.key, data.value );
			} //end for
		} //end if
	}// end new
	
	public function Move( x : Int, y : Int ) : Void{ 
		this.domContainer.css("left", x + "px");
		this.domContainer.css("top", y + "px");
	} // end move
	
	public function Size( width : Int, height : Int ) : Void{ 
		var s : String = width + "px " + height + "px";
		this.domSprites.css( "background-size", s );
		this.domSprites.css( "width", width + "px" );
		this.domSprites.css( "height", height + "px" );
		this.domContainer.css( "width", width + "px" );
		this.domContainer.css( "height", height + "px" );
		this.domGroup.css( "width", width + "px" );
		this.domGroup.css( "height", height + "px" ); 
	} // end Size
	
	public function Hide() : Void{ 
		this.domContainer.hide();
	} // end hide
	
	public function Show() : Void{
		this.domContainer.show();
	} // end show
	
	public function Html(text : String) : Void{ 
		this.domSprites.append(text);
	} // end html
	
	public function SetAnimation(image : String) : Void{ 
		this.domSprites.css("background-image", "url('" + image + "')" );
	} // end SetAnimation
	
	public function click(call : js.JqEvent -> Void) : Void{
		this.domSprites.click( call );
		
	} // end click
	public function mouseover(call : JqEvent -> Void) : Void{ 
		this.domSprites.mouseover(call);
	} // end mouseover
	public function mouseleave(call : JqEvent -> Void) : Void{ 
		this.domSprites.mouseleave(call);
	} // end mouseleave
} // end Blob