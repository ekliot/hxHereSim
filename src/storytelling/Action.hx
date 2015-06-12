/* (c) Elijah Kliot @ekliot */

/**
 * An object that represents the act of doing something
 * To be used to be extended by specific Actions
 * I'm undecided how to implement this, Abstracts could be handy
 */
class Action{
    //what this Action does

    //what does this Action depend on

    private var _name:String;

    private var _factors:Array< Float >;

    private var _actor:Actor;

    public function new( ?hash : Float, ?name : String, ?fac : Array< Float >, ?actor : Actor ){
        if( hash != null ){
            var hashed:Action = fromHash( hash );
            this._name = hashed.getName();
            this._factors = hashed.getFactors();
            this._actor = hashed.getActor();
        }
        else{
            this._name = name;
            this._factors = fac;
            this._actor = actor;
        }
    }

    public function new( durr : Bool ){

    }

    public function getName():String{
        return this._name;
    }

    public function getFactors():Array< Float >{
        return new Array< Float >();
    }

    public function getActor():Actor{
        return _actor;
    }

    public function act( actor : Actor, subjects : Array< Actor > ):Void{

    }

    public function hash():Float{
        // takes vars and generates a hash
        return 0.0;
    }

    private static function fromHash( hash : Float ):Action{
        // take a hash and return its Action
        return new Action( hash );
    }
}
