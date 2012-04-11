package unittests;
import main.Tile;

class TileTest extends UnitTest{
	public static var IMAGE : String = "madotsuki.png";
	private var testsubject : Tile;
	public function new(){ 
		super();		
		this.testsubject = new Tile();
	} // end new
	override public function IntegrationTest(){ 
		this.testsubject.SetAnimation(TileTest.IMAGE);
		this.testsubject.Position( { x : 166, y : 88 } );
		this.testsubject.Size( { width : 75, height : 75 } );
		this.testsubject.Show();
	} // end IntegrationTest
} // end TileTest