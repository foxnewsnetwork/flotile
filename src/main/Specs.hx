package main;

class Specs{ 
	private var key : Array<String>;
	private var value : Array<String>;
	private var length : Int;
	
	public function new(key : Array<String>, value : Array<String>){ 
		this.key = key;
		this.value = value;
		this.length = key.length;
		if( this.length != value.length ){ 
			// FIXME: throw error here
		}
	} // end new
	public function Length() : Int{ 
		return this.length;
	}// end length
	public function get( n : Int ) : { key : String, value : String }{ 
		return { 
			key : this.key[n] ,
			value : this.value[n]
		};
	} // end get
}// end Specs