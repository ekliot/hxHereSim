/* (c) Elijah Kliot @ekliot */

@:abstract
abstract ActionHash( Float ){

    public function new( subj : Action ){
        // this = subj.toHash
    }

    public function fromAction(){
        //take Action and return a hash value
    }

    @:to
    public function toAction(){
        //take hash value and return an Action Class
    }
}
