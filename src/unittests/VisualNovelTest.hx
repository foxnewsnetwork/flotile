package unittests;
import character.VisualNovel;
import character.SceneData;
import js.JQuery;

class VisualNovelTest extends UnitTest {
	private var testsubject : VisualNovel;
	public function new(){ 
		super();		
		this.testsubject = new VisualNovel();
	} // end new
	override public function IntegrationTest() { 
		var sd1 : SceneData = {
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
		var sd2 : SceneData = {
			background : { 
				image : "madotsuki.png"
			} , // end background
			foreground : { 
				images : ["madotsuki.png", "madotsuki.png"] ,
				positions : [{ x : 24, y : 50 }, { x : 62, y : 20 }] ,
				sizes : [{ width : 16, height : 18 }, { width : 12, height : 16 }]
			} , // end foreground
			text : { 
				speaker : "Madotsuki" ,
				content : "foobar"
			} // end text
		}; //end SceneData
		this.testsubject.LoadingDisplay().SetAnimation("madotsuki.png");
		this.testsubject.Load([sd1, sd2]);
		this.testsubject.Scene(0);
		this.testsubject.Click( (function(vn : VisualNovel){
			return function( e : JqEvent ){ vn.Next(); };
		})(this.testsubject) ); // end Next
		this.testsubject.End( function(){ 
			this.testsubject.Scene(0);
		} );
	} // end IntegrationTest
} // end VisualNovelTest