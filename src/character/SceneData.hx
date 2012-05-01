package character;

typedef SceneData = {
	background : { 
		image : String
	} ,
	foreground : { 
		images : Array<String> ,
		positions : Array<{ x : Float, y : Float }> ,
		sizes : Array<{ width : Float, height : Float }>
	} ,
	text : { 
		speaker : String ,
		content : String
	}
}