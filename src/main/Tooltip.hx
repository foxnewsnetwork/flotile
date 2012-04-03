package main;

// Requires the external class tooltip
class Tooltip {
	public static function show( text : String ) : Void{
		untyped  tooltip.show( text );
	}// end show
	public static function hide() : Void { 
		untyped tooltip.hide();
	} // end hide
}