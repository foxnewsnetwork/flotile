package main;
import js.JQuery;

class Shop {
	public var items : Array<Item>;
	public function new(){ 
		// Nothing to do here
		return;
	} // end new
	public function Stock(items : Array<Item>){ 
		var tiles : Array<ItemTile> = [];
		this.items = items;
		var item : Item;
		var tile : ItemTile;
		for( k in 0...items.length ){ 
			item = items[k];
			tiles.push( new ItemTile(item) );
			tile = tiles[k];
			tile.CSS("border-radius", "5px");
			tile.CSS("-moz-border-radius", "5px");
			tile.CSS("border", "1px solid black");
			tile.Click( function(e : JqEvent){
				Form.RemoveAll();
				var payment : PaymentForm = new PaymentForm(tile);
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