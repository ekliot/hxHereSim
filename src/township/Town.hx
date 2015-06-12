import Person;
import Townsfolk;

class Town{
	private var _ticker : Int;
	private var _popul : Array< Townsfolk >;

	public function new( _ticker = 0, _popul : Array< Townsfolk > ){
		this._ticker = _ticker;
		this._popul = _popul;
	}

	public function tick():Void{
		_ticker += 1;
		for( actor in _popul ){
			Sys.println( "\n" + actor.getName() + " is acting" );
			var sub = actor.subterfuge();
			Sys.println(  actor.getName() + ' rolled a $sub' );

			var count = 0;

			trace( _popul.length );

			for( n in 0 ... _popul.length ){
				trace( n );
				var folk = _popul[ n ];
				if( !folk.equals( actor ) ){
					var per = folk.perceive();

					if( per > sub ){
						_popul.unshift( actor );
						_popul.remove( _popul[ _popul.lastIndexOf( actor ) ] );
						count += 1;
						Sys.println( actor.getName() +  " was detected by " + folk.getName() + ' with a roll of $per' );
						break;
					}

					else if ( per <= sub ){
						Sys.println( actor.getName() + " eluded " + folk.getName() );
					}
				}
			}

			Sys.println( actor.getName() + ' has finished their action' );
		}
	}

	public function getPop():Array< Townsfolk >{
		return _popul;
	}

	public function toString():String{
		return 'Town population: $_popul ; Current day: $_ticker';
	}
}
