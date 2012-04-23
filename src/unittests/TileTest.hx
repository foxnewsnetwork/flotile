package unittests;
import main.Tile;
import js.JQuery;

class TileTest extends UnitTest{
	public static var IMAGE : String = "madotsuki.png";
	private var testsubject : Tile;
	public function new(){ 
		super();		
		this.testsubject = new Tile();
	} // end new
	override public function IntegrationTest(){ 
		this.testsubject.SetAnimation(TileTest.IMAGE);
		
		this.testsubject.Position( { x : 10, y : 10 } );
		this.testsubject.Size( { width : 15, height : 15 } );
		this.testsubject.Show();
		
	} // end IntegrationTest
} // end TileTest