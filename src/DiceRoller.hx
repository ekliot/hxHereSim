import Random;

@:abstract
abstract DiceRoller( Int ){
    inline public function new( min : Int, max : Int ){
        this = Random.int( min, max );
    }
}
