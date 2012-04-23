package character;
import main.Tile;

class CharacterDisplay extends Tile {
	public function new(){ 
		super();
		this.CSS("background-size", "100% 100%");
		this.CSS("background-repeat", "no-repeat");
	} //end new
} // end CharacterDisplay