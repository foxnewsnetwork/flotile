package main;

class ItemForm extends Form{
	private var itemtile : ItemTile;
	private var item : Item;
	
	public function new(itemtile : ItemTile){ 
		super();
		this.itemtile = itemtile;
		this.item = this.itemtile.Item();
	} //end new
}