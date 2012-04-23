package character;

typedef SceneData = {
	background : { 
		image : String
	} ,
	foreground : { 
		images : Array<String> ,
		positions : Array<{ x : Int, y : Int }> ,
		sizes : Array<{ width : Int, height : Int }>
	} ,
	text : { 
		speaker : String ,
		content : String
	}
}