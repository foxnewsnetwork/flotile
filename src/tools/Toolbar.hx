package tools;
import main.Tile;
import js.JQuery;

class Toolbar extends Tile {
	private var dimension : {  rows : Int, columns : Int };
	private var vector : Array<Array<Tile>>;
	
	public function new( dim : { rows : Int, columns : Int } ) { 
		super();
		this.Dimension( dim );
		this.CSS( "border", "2px solid black" );
		this.CSS( "background-color" , "rgb(200,198,225)" );
		this.CSS( "opacity" , "0.85" );
	} // end new
	
	public function Dimension( ? dim : { rows : Int, columns : Int }  ) : { rows : Int, columns : Int } { 
		if ( dim == null ) { 
			return this.dimension;
		} // end if
		else { 
			this.dimension = dim;
			this.vector = [];
			var unitx = 85 / dim.columns;
			var unity = 70 / dim.rows;
			for( j in 0...dim.rows ){ 
				this.vector.push([]);
				for ( k in 0...dim.columns ) { 
					var mytile = new Tile();
					this.vector[j].push( mytile );
					this.domContainer.append(mytile.domContainer);
					mytile.Size({width : unitx, height : unity});
					mytile.Position({ x : 3 + k * ( unitx + 1 ), y : 10 + j * ( unity + 1 )});
					mytile.CSS( "border-radius" ,"0.5em" );
					mytile.CSS( "-moz-border-radius" , "0.5em" );
				} // end for
			} // end for 
			return this.dimension;
		} // end else
	} // end Dimension
	
	public function SetIcon( options : { image : String, row : Int, col : Int } ) { 
		var row = options.row;
		var col = options.col;
		this.vector[row][col].SetAnimation(options.image);
	} // return Set
	
	public function SetMouseover( options : { func : JqEvent -> Void, row : Int, col : Int } ) { 
		this.vector[options.row][options.col].Mouseover(options.func);
	} // end setmouseover 
	
	public function SetMouseleave( options : { func : JqEvent -> Void, row : Int, col : Int } ) { 
		this.vector[options.row][options.col].Mouseleave(options.func);
	} // end setmouseleave
	
	public function SetClick( options : { func : JqEvent -> Void, row : Int, col : Int } ) { 
		this.vector[options.row][options.col].Click(options.func);
	} // end setmouseleave
} // end Toolbar

