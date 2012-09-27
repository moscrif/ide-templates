include "lib://core/log.ms"
include "lib://game2d/game.ms"
include "app://gfx.ms"
include "app://sfx.ms"
include "app://scenes/menuScene.ms"

// custom game class
class $application$ : Game
{

    function start()
    {
        super.start();

        // load graphical resources
        GFX.load();

        // load sound and musics
        SFX.load();

        // add menu scene
        this.push(new MenuScene());
    }

    function draw(canvas)
    {
        // custom drawings - background
        canvas.drawBitmap(GFX.background, 0, 0);

        // default drawings
        super.draw(canvas);
    }

}

// create instace and run the game
new $application$().run();