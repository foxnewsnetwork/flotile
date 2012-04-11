package main;
import js.JQuery;

class Shop {
	public var items : Array<Item>;
	public function new(){ 
		// Nothing to do here
		return;
	} // end new
	public function Stock(items : Array<Item>){ 
		var tiles : Array<Tile> = new Array<Tile>();
		this.items = items;
		for( k in 0...items.length ){ 
			tiles.push( new Tile() );
			var tile : Tile = tiles[k];
			var item : Item = items[k];
			tile.SetAnimation( item.tileset );
			tile.Click( function(e : JqEvent){
				Form.RemoveAll();
				var payment : PaymentForm = new PaymentForm(item);
				payment.Position( tile.Position() );
			} );
			tile.Mouseover( function(e : JqEvent ){
				var text : String = "<p>Title: " 
					+ item.title
					+ "</p><p>Description: "
					+ item.description
					+ "</p><p>Price: $"
					+ item.price
					+ "</p>";  
				Tooltip.show(text);
			} );
			tile.Mouseleave( function(e: JqEvent){ 
				Tooltip.hide();
			} );
		} // end for
		return tiles;
	} // end Stock
	public static function main(){ 
		var FUCKINGNIGGERS : Int = 14;
	} // end main
} // end shop