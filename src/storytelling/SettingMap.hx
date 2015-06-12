/* (c) Elijah Kliot @ekliot */

/**
 * A Map of a Setting and its sub-settings
 */
class SettingMap{

    private var _parent:Setting;

    // collection of all child Settings of _parent
    private var _children:Map< String, Setting > = new Map< String, Setting >();

    /**
     * Constructor for a new SettingMap from a parent Setting
     *
     * @param   par         the Setting to be used as the root for this Map
     */
    public function new( par : Setting ){
        this._parent = par;
    }

    /**
     * Adds a child Setting to this SettingMap
     *
     * @:param  setting     the Setting to add as a child
     */
    public function addChild( setting : Setting ):Void{
        this._children.set( setting.getName(), setting );
        setting.inherit( this._parent );
    }

    /**
     * Returns the parent Setting
     */
    public function getParent():Setting{
        return this._parent;
    }

    /**
     * Returns the children of this Map
     *
     * @:return a Map of child Settings
     */
    public function getChildren():Map< String, Setting >{
        return this._children;
    }

    /**
     * Returns a String representation of this SettingMap
     *
     * @:return $name{{ $children }}
     */
    public function toString():String{
        return "" + _parent.toString() + "{{ " + _children.toString() + " }}";
    }
}
