package unittests;
import character.VisualNovelEditor;
import character.SceneData;
import js.JQuery;

class VisualNovelEditorTest extends UnitTest {
	private var testsubject : VisualNovelEditor;
	
	public function new() { 
		super();
		this.testsubject = new VisualNovelEditor();
	} // end new
	
	public override function IntegrationTest() { 
		var sd1 : SceneData = {
			background : { 
				image : "madotsuki.png"
			} , // end background
			foreground : { 
				images : ["madotsuki.png", "madotsuki.png"] ,
				positions : [{ x : 22.0, y : 20.0 }, { x : 42.0, y : 20.0 }] ,
				sizes : [{ width : 6.0, height : 8.0 }, { width : 12.0, height : 16.0 }]
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
				positions : [{ x : 24.0, y : 50.0 }, { x : 62.0, y : 20.0 }] ,
				sizes : [{ width : 16.0, height : 18.0 }, { width : 12.0, height : 16.0 }]
			} , // end foreground
			text : { 
				speaker : "Madotsuki" ,
				content : "foobar"
			} // end text
		}; //end SceneData
		
		this.testsubject.Load([sd1, sd2]);
		
		this.testsubject.EnterEditMode(function(position){
			js.Lib.alert("faggot");
			return;
		}, function(size){ 
			return;
		} ); // end EnterEditMode
		this.testsubject.SetUI({ 
			num : 0, 
			col : 0, 
			row : 0, 
			images : "madotsuki.png", 
			callbacks : function(e:JqEvent) { js.Lib.alert("faggot"); } 
		}); // end SetUI
		this.testsubject.SetUI({ 
			num : 0, 
			col : 1, 
			row : 0, 
			images : "madotsuki.png", 
			callbacks : function(e:JqEvent) { return; } 
		}); // end SetUI
		this.testsubject.SetUI({ 
			num : 2, 
			col : 0, 
			row : 0, 
			images : "madotsuki.png", 
			callbacks : function(e:JqEvent) { return; } 
		}); // end SetUI
		this.testsubject.Keypress(function(e){ 
			if( e.charCode == 13 ) { 
				var obj = this.testsubject.GetState();
				var text = untyped JSON.stringify(obj);
				js.Lib.alert(text);
				this.testsubject.Next();
			} // end if
		} ); // end Keypress
		
		this.testsubject.Scene(0);
		this.testsubject.End(function(){ 
			this.testsubject.Scene(0);
		}); // end End
		
	} // end IntegrationTest
	
	
} // end visualnoveleditortest