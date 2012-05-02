package tools;
import main.Tile;

class VerticalBar extends Toolbar{
	
	public function new() { 
		super({rows : 0 , columns : 0});
		this.Length(6);
	} // end new
	
	public function Length( ?length : Int  ) : Int { 
		if ( length == null ) { 
			return this.dimension.columns;
		} // end if
		else { 
			this.dimension.rows = 1;
			this.dimension.columns = length;
			this.vector = [];
			var unitx = 95.0;
			var unity = 70.0 / length;
			this.vector.push([]);
			for ( k in 0...length ) { 
				var mytile = new Tile();
				this.vector[0].push( mytile );
				this.domContainer.append(mytile.domContainer);
				mytile.Size({width : unitx, height : unity});
				mytile.Position({ x : 0.5, y : 10 + k * ( unity + 1 )});
				mytile.CSS( "border-radius" ,"0.5em" );
				mytile.CSS( "-moz-border-radius" , "0.5em" );
			} // end for
			return this.dimension.columns;
		} // end else
	} // end Dimension  
} // end VerticalBar