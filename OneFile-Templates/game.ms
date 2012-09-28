type: moscrif source code
name: Game
description: Game skeleton
author: Jozef Prídavok and Moscrif 2010-2012
param: gameName		text	MyGame	^[a-zA-Z_][a-zA-Z0-9_]*$
param: customDraw	bool	true
################################################################################
// Date: $now$
// Author: $username$ on $computername$

include "lib://game2d/game.ms"

class $gameName$ : Game
{
    function start()
    {
        super.start();

        // load graphical resources
        // GFX.load();

        // load sound and musics
        // SFX.load();

        // add menu scene, sprites, etc
        // this.push(new MenuScene());
    }

$if(customDraw)$
    function draw(canvas)
    {
        // custom drawings - background
        // canvas.drawBitmap(GFX.background, 0, 0);

        // default drawings
        super.draw(canvas);
    }

$endif$
}