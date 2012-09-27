include "lib://game2d/textButton.ms"
include "lib://game2d/label.ms"
include "app://options.ms"

class OptionsScene : Scene
{
    function init()
    {
        super.init();

        this.add(new Label({text:"Options", y:200, x:System.width/2}));

        this._level = new TextButton({x:System.width/2, y:System.height/10*5});
        this._level.onClick = function() { this super._toggleLevel(); }
        this.add(this._level);

        this._sounds = new TextButton({x:System.width/2, y:System.height/10*6});
        this._sounds.onClick = function() { this super._toggleSounds(); }
        this.add(this._sounds);

        this._musics = new TextButton({x:System.width/2, y:System.height/10*7});
        this._musics.onClick = function() { this super._toggleMusics(); }
        this.add(this._musics);

        this._back = new TextButton({text:"Back", x:System.width/2, y:System.height/10*9});
        this._back.onClick = function() {
            SFX.playClick();
            this super._goBack();
        }
        this.add(this._back);
    }

    function enter()
    {
        this._update();
    }

    function _goBack()
    {
        Game.instance.pop(new SlideToBottom());
    }

    function _update()
    {
        switch (Options.level) {
            case 0: this._level.text = String.printf("Level : easy"); break;
            case 1: this._level.text = String.printf("Level : normal"); break;
            case 2: this._level.text = String.printf("Level : hard"); break;
            default: assert false;
        }
        this._sounds.text = String.printf("Sounds : %s", Options.sounds ? "on" : "off");
        this._musics.text = String.printf("Musics : %s", Options.musics ? "on" : "off");
    }

    function _toggleLevel()
    {
        Options.level++;
        if (Options.level > 2)
            Options.level = 0;
        Options.save();
        this._update();
    }

    function _toggleSounds()
    {
        Options.sounds = !Options.sounds;
        Options.save();
        if (Options.sounds)
            SFX.playClick();
        this._update();
    }

    function _toggleMusics()
    {
        Options.musics = !Options.musics;
        Options.save();
        if (Options.musics)
            SFX.playMusic();
        else
            SFX.stopMusic();
        this._update();
    }

}