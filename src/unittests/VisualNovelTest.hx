package unittests;
import character.VisualNovel;
import character.SceneData;

class VisualNovelTest extends UnitTest {
	private var testsubject : VisualNovel;
	public function new(){ 
		super();		
		this.testsubject = new VisualNovel();
	} // end new
	override public function IntegrationTest() { 
		var sd : SceneData = {
			background : { 
				image : "madotsuki.png"
			} , // end background
			foreground : { 
				images : ["madotsuki.png", "madotsuki.png"] ,
				positions : [{ x : 22, y : 20 }, { x : 42, y : 20 }] ,
				sizes : [{ width : 6, height : 8 }, { width : 12, height : 16 }]
			} , // end foreground
			text : { 
				speaker : "Madotsuki" ,
				content : "Hello World"
			} // end text
		}; //end SceneData
		this.testsubject.PlayScene(sd);
		this.testsubject.Background().Hide();
	} // end IntegrationTest
} // end VisualNovelTest