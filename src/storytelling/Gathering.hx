class Gathering<T>{
	private var _root:T;
	private var _subject:T;
	private var _entities:Array<T> = new Array<T>();

	/**
	 *
	 */
	public function new( root : T ){
		this._root = root;
		this._subject = root;
		this._entities.push( root );
	}

	/**
	 *
	 */
	public function new( seed : Gathering ){
		this._entities = seed.getEntities();
		this._root = seed.getRoot();
		this._subject = seed.getSubject();
	}

	//picks an entity to narrate
	public function pick():T{
		return _entities.get(0);
	}

	//returns a copy of this Gathering
	public function getAll():Gathering<T>{
		return new Gathering<T>( this );
	}

	//returns an entity at a certain index, -1 for _root
	public function get( indx : Int ):T{
		if( _entities.length <= ( indx + 1 ) ){
			return _entities[ indx ];
		}
		else{
			return Null<T>;
		}
	}

	//get a copy of _entities
	public function getEntities():Array<T>{
		return new Array<T>( _entities );
	}

	//get the Type of the Gathering
	public function getType():T{
		return T;
	}

	public function getRoot():T{
		return _root;
	}

	public function getSubject():T{
		return _subject;
	}

	public function find( subj : T ):T{
		//find subj in _entities
		return Null< T >;
	}

	//returns a string representation of this Gathering
	public function toString():String{
		return "";
	}

	//Checks if another object is equivalent to this Gathering
	//(assuming all members of the Gathering are unique)
	public function equals( subj : Class ):Bool{
		return false;
	}
}
