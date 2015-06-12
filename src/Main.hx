package src;

class Main{
	public static function main():Void{
		var names = [ "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K" ];
		var _popul = new Array< Townsfolk >();

		for ( name in names  ){
			_popul.push( new Townsfolk( name, 1, 4, 1, 4 ) );
		}

		var twn = new Town( 0, _popul );

		while ( twn.getPop().length > 1 ){
			Sys.println( twn.toString() );
			twn.tick();
			Sys.sleep(3);
		}
	}
}
