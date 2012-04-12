package main;

class ItemTile extends Tile{
	private var item : Item;
	private var buys : Array<PaymentInfo -> Void>;
	
	public function new(item : Item){ 
		super();
		this.buys = [];
		this.item = item;
		this.SetAnimation(this.item.tileset);
	} //end new
	public function Item() : Item{ return this.item; } // end item
	override public function Stats() : Dynamic{ 
		var output = { 
			item : this.item,
			stats : super.Stats()
		}; // end output
		return output;
	} // end Stats
	
	override public function ClearStats() : Dynamic{ 
		return { 
			item : this.item,
			stats : super.ClearStats()
		}; // end return
	} // end ClearStats
	
	// Dumb shit happens whenboth parameters are null
	public function Buy( ?cb : PaymentInfo -> Void, ?payment : PaymentInfo ){ 
		if( cb == null && payment != null ){ 
			for( k in 0...this.buys.length ){ 
				this.buys[k](payment);
			}//end for
		}//end if
		else if( cb != null ){ 
			this.buys.push(cb);
		}//end else if
		else{ 
			return;
		} //end else
	} //end Buy
} // end ItemTile