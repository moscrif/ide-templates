include "lib://game2d/textButton.ms"
include "lib://game2d/sceneTransitions/slideToTop.ms"
include "lib://game2d/sceneTransitions/slideToBottom.ms"
include "app://scenes/singlePlayerScene.ms"
include "app://scenes/multiPlayerScene.ms"
include "app://scenes/optionsScene.ms"

class MenuScene : Scene
{
    function init()
    {
        super.init();

        this._singlePlayer = new TextButton({text:"Single Player", x:System.width/2, y:System.height/10*7});
        this._singlePlayer.onClick = function() {
            SFX.playClick();
            this super._playSinglePlayer();
        }
        this.add(this._singlePlayer);

        this._multiPlayer = new TextButton({text:"Multi Player", x:System.width/2, y:System.height/10*8});
        this._multiPlayer.onClick = function() {
            SFX.playClick();
            this super._playMultiPlayer();
        }
        this.add(this._multiPlayer);

        this._options = new TextButton({text:"Options", x:System.width/2, y:System.height/10*9});
        this._options.onClick = function() {
            SFX.playClick();
            this super._showOptions();
        }
        this.add(this._options);
    }

    function _playSinglePlayer()
    {
        Game.instance.push(new SinglePlayerScene(), new SlideToTop());
    }

    function _playMultiPlayer()
    {
        Game.instance.push(new MultiPlayerScene(), new SlideToTop());
    }

    function _showOptions()
    {
        Game.instance.push(new OptionsScene(), new SlideToTop());
    }

}