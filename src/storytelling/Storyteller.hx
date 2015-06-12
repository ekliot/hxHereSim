/* (c) Elijah Kliot @ekliot */

//WHEN TELLING A STORY, CONCERN YOURSELF NOT WITH "IF IT WILL HAPPEN", BUT INSTEAD WITH "HOW WILL IT HAPPEN"

import haxe.Template;

/**
 * This is a class that is intended to take a framework of a story, and then
 * narrate that story based on its characters and setting.
 * Currently being implemented to follow the Hero's Journey model of story.
 * Ideally, this will be able to be implemented in different contexts.
 *
 * A Storyteller extends an Actor, which means a Storyteller can narrate itself
 * and take actions itself, allowing a somewhat dynamic storytelling experience.
 *
 * i.e. "I [narrator] will tell you a story that [Actor] told me in [Setting]"
 */
class Storyteller extends Actor{

    //global actors
    private var _actors:Array< Actor > = new Array< Actor >();
        //which one is the narrator? presumably at indx[0]...

    //global settings
    private var _settings:SettingMap;

    //global stages
    private var _stages:Array< String > = [ "Buffer", "A001", "B002", "C003" ];

    //global time ??? (is it necessary?)
    // private var

    //current actor being narrated...
    private var _curSubj:Actor;

    //in this setting...
    private var _curSetting:Setting;

    //in this stage of the story...
    private var _curStage:String;

    /**
     * Constructor for a new Storyteller.
     * In future will take input from a text stream.
     *
     * @:param  name    The name of the Storyteller
     * @:param  file    not implemented
     */
    public function new( name : String /* file : File */ ){
        super( name );

        //iterate over file and fill _settings, _actors, and _stages
        //pick _curSubj, _curStage, _curSetting

        _actors.push( this );
        _settings = new SettingMap( createSetting() );

        this._curSubj = pickActor( _actors );

        this._curSetting = pickSetting( _settings );

        this._curStage = _stages.pop();
    }

    /**
     * Picks a random setting fro a SettingMap.
     * Currently just picks the root of the SettingMap, waiting on implementing
     * a pickSetting function in SettingMap.
     *
     * @:param  map     a SettingMap containing the scope of selection
     *
     * @:return         a Setting picked from the mapping
     */
    private function pickSetting( map : SettingMap ):Setting{
        return map.getParent();
        // return map.pickSetting();
    }

    /**
     * Picks a random actor from an Array.
     * Currently set up to only pick the first index of the Array.
     *
     * @:param  list    an Array of Actors
     *
     * @:return         a single Actor from the Array
     */
    private function pickActor( list : Array< Actor > ):Actor{
        if( list.length != 0 ){
            return list[ 0 ];
        }

        return createActor();
    }

    /**
     * Given an actor, and a setting, it will return a String narrating the story
     * in the current stage.
     * Currently barebones, and has stage cycling built-in. In the future, it will
     * only return a String that narrates just a single stage.
     *
     * @:param  subj    not implemented
     * @:param  loc     not implemented
     *
     * @:return         a String of the Storyteller's narration
     */
    public function narrate( /* subj : Actor = _curSubj, loc : Setting = _curSetting */ ):String{
        var subj:Actor = _curSubj;
        var loc:Setting = _curSetting;

        var ret:String = "";

        // var samp:Template = new haxe.Template( "Stage: ::_curStage:: -- ::subj.toString:: is at ::loc.toString::\n" );

        while( _stages.length > 0 ){
            // ret = ret + samp.execute( this );
            ret = ret + "Stage: " + _curStage + " -- " + subj.toString() + " is at " + loc.toString() + "\n";
            this.nextStage();
        }

        return ret;
    }

    /**
     * Cycles the current stage to the next in the sequence.
     */
    public function nextStage():Void{
        this._curStage = _stages.pop();
    }

    /**
     * Creates a fresh Setting when the Storyteller needs to fill a gap.
     * For now just makes a dummy Setting.
     *
     * @:return     a new setting
     */
    private function createSetting():Setting{
        return new Setting( "Mordheim" );
    }

    /**
     * Creates a fresh Actor when the Storyteller needs to fill a gap.
     * For now just makes a dummy Actor.
     *
     * @:param  ?loc    optional parameter, if provided can focus the created character
     *
     * @:return         a new character
     */
    private function createActor( ?loc : Setting ):Actor{
        return new Actor( "Paul Atreides" );
    }
}
