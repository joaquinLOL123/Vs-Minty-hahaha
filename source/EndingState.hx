package;

import flixel.FlxSprite;
import flixel.FlxG;

class EndingState extends MusicBeatState
{
    var imageToUse:String;
    var songToPlay:String;
    var theEnding:String;

    override public function new(ending:String):Void
    {
        super();
        
        imageToUse = 'endings/' + ending + 'EndingPoster';
        if (ending != 'Cheat')
        {
            songToPlay = ending + 'EndingMusic';
        }
        theEnding = ending;
    }

    override function create():Void
    {
        super.create();

        var EndingPoster:FlxSprite = new FlxSprite();
        EndingPoster.loadGraphic(Paths.image(imageToUse));
        EndingPoster.screenCenter();
        EndingPoster.scale.set(1.5, 1.5);
        EndingPoster.antialiasing = ClientPrefs.globalAntialiasing;
        add(EndingPoster);

        FlxG.sound.playMusic(Paths.music(songToPlay));
    }

    override function update(elapsed:Float):Void 
    {
        super.update(elapsed);

        if(controls.ACCEPT && theEnding != 'Cheat')
        {
            MusicBeatState.switchState(new StoryMenuState());
        }
    }
}