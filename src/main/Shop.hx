package main;
import js.JQuery;

class Shop {
	public var items : Array<Item>;
	public function new(){ 
		// Nothing to do here
		return;
	} // end new
	public function Stock(items : Array<Item>){ 
		var tiles : Array<Blob> = new Array<Blob>();
		this.items = items;
		for( k in 0...items.length ){ 
			tiles.push( new Blob() );
			var tile : Blob = tiles[k];
			var item : Item = items[k];
			tile.SetAnimation( item.tileset );
			tile.mouseover( function(e : JqEvent ){
				var text : String = "<p>Title: " 
					+ item.title
					+ "</p><p>Description: "
					+ item.description
					+ "</p><p>Price: $"
					+ item.price
					+ "</p>";  
				Tooltip.show(text);
			} );
			tile.mouseleave( function(e: JqEvent){ 
				Tooltip.hide();
			} );
		} // end for
		return tiles;
	} // end Stock
	public static function main(){ 
		var FUCKINGNIGGERS : Int = 14;
	} // end main
} // end shop