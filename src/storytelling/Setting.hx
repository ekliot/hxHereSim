/* (c) Elijah Kliot @ekliot */

/**
 * A Setting can only have one parent (_parent), but several children (_scope)
 * Characters can move directly to any Setting in the same Map (its parent's
 * children) or its own parent or children. Moving to any other Setting requires
 * transit through conneccting Settings
 */
class Setting{
    //who, what, where
        //who
            //who is here?
            //what kind of people would be here?
        //what
            //what is the name?
            //is there a parent setting?
            //are there smaller sub-settings?
            //what are this setting's attributes?

    // the name of this Setting
    private var _name:String;

    // the parent of this Setting, by default itself (no parent)
    private var _parent:Setting = this;

    // the scope of this Setting (its children)
    private var _scope:SettingMap;

    // the unique Attributes of this Setting (incommplete)
    private var _properties:Array< Float >;

    /**
     * Constructor for a new Setting with just a name param, everything
     * else either randomized at start or assigned after instantiation.
     */
    public function new( name : String ){
        this._name = name;
    }

    /**
     * Constructor for a new Setting branching from a parent Setting.
     * Haxe doesn't like multiple constructors, so I need to work on
     * implementing this.
     */
    // public function new( name : String, par : Setting ){
    //     this._name = name;
    //     this.inherit( par );
    // }

    /**
     * Assigns a parent Setting for this Setting
     *
     * @:param  par     the parent Setting.
     */
    public function inherit( par : Setting ):Void{
        this._parent = par;
    }

    /**
     * Assigns a SettingMap for this Setting, with itself as the root, so
     * that children Settings can be assigned
     */
    public function subdivide():Void{
        this._scope = new SettingMap( this );
    }

    /**
     * Adds a child Setting to this Setting's scope, creating a scope if need be
     *
     * @:param  child   the Setting to add as a child
     */
    public function addChild( child : Setting ):Void{
        if( this._scope == null ){
            this.subdivide();
        }
        this._scope.addChild( child );
    }

    /**
     * Returns the name of this Setting
     *
     * @:return the name of this Setting
     */
    public function getName():String{
        return this._name;
    }

    /**
     * Returns a String representation of this Setting
     * Currently just gives a copy of the name, more details to implement
     */
    public function toString():String{
        return "" + this._name;
    }
}
