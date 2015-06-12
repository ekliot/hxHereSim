import Random;

class Townsfolk extends Person{

	private var _name:String;

	private var _maxPer:Int = 4;
	private var _minPer:Int = 1;
	private var _maxSub:Int = 4;
	private var _minSub:Int = 1;

	public function new( _name : String, _minPer : Int, _maxPer : Int, _minSub : Int, _maxSub : Int ){
		super();
		this._name = _name;
		// this._maxPer = _maxPer;
		// this._minPer = _minPer;
		// this._maxSub = _maxSub;
		// this._minSub = _minSub;
	}

	public function perceive():Int{
		var res = Random.int( _minPer, _maxPer );
		return res;
	}

	public function subterfuge():Int{
		var res = Random.int( _minSub, _maxSub );
		return res;
	}

	public function equals( subj : Townsfolk ):Bool{
		if( subj.toString() == toString() ){
			return true;
		}
		return false;
	}

	public function getName():String{
		return _name;
	}

	public function getStats():String{
		return '[ $_minPer : $_maxPer ; $_minSub : $_maxSub ]';
	}

	public function toString():String{
		return '$_name ; Per[ $_minPer : $_maxPer ] ; Sub[ $_minSub : $_maxSub ]';
	}
}
