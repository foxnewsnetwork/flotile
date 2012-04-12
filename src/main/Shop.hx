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
			tile.Click( (function(tile : ItemTile){
				return function(e : JqEvent){
					Form.RemoveAll();
					var payment : PaymentForm = new PaymentForm(tile);
					var posx = tile.Position().x - Math.floor(payment.Size().width/2);
					var posy = tile.Position().y - Math.floor(payment.Size().height/2);
					posx = posx > 5 ? posx : 5;
					posy = posy > 5 ? posy : 5;
					payment.Position({ x : posx, y : posy }); 
				};// end return 
			})(tile) ); // end Click
			tile.Mouseover((function(item : Item){ 
				return function(e : JqEvent ){
					var text : String = "<p>Title: " 
						+ item.title
						+ "</p><p>Description: "
						+ item.description
						+ "</p><p>Price: $"
						+ item.price
						+ "</p>";  
					Tooltip.show(text);
				}; // end return
			})(item));
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