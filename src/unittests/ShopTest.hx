package unittests;
import main.Shop;
import main.ItemTile;
import main.Item;
import main.Element;
import main.PaymentInfo;
import js.JQuery;

class ShopTest extends UnitTest{
	private var testsubject : Shop;
	public function new(){ 
		super(); 
		this.testsubject = new Shop();
	} // end new
	override public function IntegrationTest(){
		var el : Element = new Element();
		var items = [
			{
				description : "madotsuki pic 01",
				tileset : "madotsuki.png" ,
				id : 12 ,
				price : 15.99 ,
				company_id : 655 , 
				title : "Madotsuki1" ,
				created_at : Date.now() ,
				updated_at: Date.now()
			},
			{
				description : "madotsuki pic 02",
				tileset : "madotsuki.png" ,
				id : 13 ,
				price : 17.99 ,
				company_id : 155 , 
				title : "Madotsuki2" ,
				created_at : Date.now() ,
				updated_at: Date.now()
			}
		];
		var tiles : Array<ItemTile> = this.testsubject.Stock(items);
		for( k in 0...tiles.length){ 
			tiles[k].Position({ x : k * 100, y : 10 });
			tiles[k].Size({width : 75, height : 75});
			tiles[k].Buy((function(el : Element, tile : ItemTile){
				return function(pay : PaymentInfo){ 
					el.HTML(untyped JSON.stringify(pay));
				}; // end return
			})(el, tiles[k])); // end Buy
			tiles[k].Click((function(el : Element, tile : ItemTile){ 
				return function(e : JqEvent){ 
					el.HTML( untyped JSON.stringify( tile.ClearStats() ) );
				}; //end return
			})(el, tiles[k])); //end Click
		} //end length
		
		
	}//end Integration Test
} // end ShopTest