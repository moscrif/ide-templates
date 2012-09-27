include "lib://core/log.ms"
include "lib://game2d/game.ms"
include "app://gfx.ms"

// custom game class
class $application$ : Game
{

    function start()
    {
        super.start();
        // additional initialization code goes here

        // load graphical resources
        GFX.load();

        // prepare game
        this._initSprites();
    }

    function draw(canvas)
    {
        // custom drawings - background
        canvas.drawBitmap(GFX.background, 0, 0);

        // default drawings
        super.draw(canvas);
    }

    function _initSprites()
    {
        // create one sprite (crate)
        this._box = new Sprite({image:GFX.box, x:System.width/2, y:System.height/2});
        // add sprite to game
        this.add(this._box);
    }

}

// create instace and run the game
new $application$().run();