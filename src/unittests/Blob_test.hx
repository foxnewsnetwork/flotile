package unittests;
import main.Blob;
import js.JQuery;

// Obviously, the test class for unit blobs
class Blob_test {
	public var myblob : Blob;
	
	public function integration_test() : Void{ 
		var image : String = "http://i907.photobucket.com/albums/ac271/Bash_Emm/180-1.jpg";
		this.myblob.SetAnimation( image );	
		this.myblob.Move(22, 31);
		this.myblob.Size( 150, 150 );
		this.myblob.mouseover( (function(blob : Blob) : js.JqEvent -> Void{ 
			return function( e : js.JqEvent ){ 
				blob.Move(33, 43);
			}; // end return
		})(this.myblob) ); // end mouseover
	} // end integration_test
	public function new(){ 
		this.myblob = new Blob();
	} // end new
	public static function main() : Void{
		 var test : Blob_test = new Blob_test();
		 test.integration_test();
	} // end run
}