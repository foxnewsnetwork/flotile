package unittests;
import main.PaymentForm;
import main.Item;

class FormTest extends UnitTest{
	public static var ITEM : Item = { 
		description : "Fucking niggers",
		tileset : "madotsuki.png",
		id : 15 ,
		price : 16.0 ,
		company_id : 66 , 
		title : "Madotsuki" ,
		created_at : Date.now() ,
		updated_at: Date.now()
	};
	private var testsubject : PaymentForm;
	
	public function new(){ 
		super(); 
		this.testsubject = new PaymentForm(FormTest.ITEM);
	} // end new
	override public function IntegrationTest(){
		this.testsubject.Position({x : 256, y : 256});
		this.testsubject.Show();
	}//end Integration Test 
} // end FormTest