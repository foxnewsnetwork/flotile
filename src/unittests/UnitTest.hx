package unittests;

class UnitTest {
	public static var UnitTests : Array<UnitTest> = [];
	
	public function new(){ 
		UnitTests.push(this);
	} // end new
	public function IntegrationTest(){
		// Nothing to do here
	} // end IntegrationTest
	public static function main(){ 
		// TODO: initialize additional tests in here
		var vntest = new VisualNovelTest();
		
		// var shoptest = new ShopTest();
		
		for( k in 0...UnitTest.UnitTests.length ){ 
			UnitTest.UnitTests[k].IntegrationTest();
		} //end for
	}//end main 
} // end UnitTest