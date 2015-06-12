/* (c) Elijah Kliot @ekliot */

/**
 * An Actor is an entity that can decide on Actions to take based on certain
 * internal and external factors and attributes.
 */
class Actor{
    //actions to take
        //modified each time current state changes

    //current state
        //location
            //who else is there
            //what influence does the location have
        //action
            //how much time until completion
            //how important is this
                //what will happen if it stops (what will happen if it does not finish)
                //what will happen if it finishes (what will happen if it does not stop)

    private var _name:String;

    public function new( name : String ){
        this._name = name;
    }

    //what do I want to do
    /**
     * Given an Array of possible actions, decides what is the most favourable
     *
     * @:param  things  an Array of at least one Action to choose from
     * @:param  thresh  the threshold for a favourable action
     *
     * @:return the Action to do
     */
    public function whatDoIDo( actions : Array< Action >, thresh : Float ):Action{
        //find the first thing that my mood agrees with
        for( act in actions ){
            //if my mood agrees with it, do it
            if( doIDo( whatAreFactors( act ), thresh ) ){
                return act;
            }
        }

        // if nothing is found, try again with a lower threshhold
        return whatDoIDo( actions, thresh - 5 );
    }

    //Float == factor like%

    //function one asks oneself before deciding on whether to act, providing all relevant decision-making factors

    /**
     * Polls the Actor whether they want to do an Action or not
     *
     * @:param  fac     arbitrary Array of opinions (like%) on relevant factors
     * @:param  thresh  the minimum average opinion on an action needed to do it
     *
     * @:return whether the action is done or not
     */
    private function doIDo( fac : Array< Float >, thresh : Float ):Bool{
        /**my mood is...

        MY PAST LIFE IS DELEGATING MY OPINION, NOT WHAT I EXPECT TO FEEL.
        THE CLOSER THE PERCIEVED GAP BETWEEN THE 'PAST' AND 'PRESENT,' WHICH IS...

        */

        //How much I want to do this...
        //the average the moods of all these factors, which is the sum divided by the size, which is...
        var avg:Float = 0.0;

        var l:Int = fac.length;

        if( l != 0 ){
            //all the things in this scope...
            for( pr in fac ){

                //which increases my sum by how much it influences me...
                avg += pr;
            }

            //divided by the amount of things in the scope...
            avg = ( avg / l );
        }

        if( avg < thresh ) return false;

        else return true;
    }

    /**
     * Analyzes an Action to determine what this Actor's opinions are of it
     *
     * @:param  thing   the Action being analyzed
     *
     * @:return an Array of Floats representing like%'s
     */
    private function whatAreFactors( subj : Action ):Array< Float >{
        //find every attribute of the thing

        var factors:Array< Float > = subj.getFactors();

        //then make an array of how I feel about it

        var ret:Array< Float > = new Array< Float >();

        for ( fac in factors ){
            ret.push( whatIThinkOf( fac ) );
        }

        return ret;
    }

    /**
     * returns the opinion of a factor
     *
     * @:param  attr    the factor being assessed (for now an arbitrary Float)
     *
     * @:return         the Float representation of the opinion
     */
    private function whatIThinkOf( attr : Float ):Float{
        return attr;
    }

    public function getName():String{
        return _name;
    }

    public function toString():String{
        return "" + _name;
    }
}
