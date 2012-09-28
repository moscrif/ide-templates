type: moscrif source code
name: Game Scene
description: Game scene skeleton
author: Jozef Prídavok and Moscrif 2010-2012
param: className     text    MyScene     ^[a-zA-Z_][a-zA-Z0-9_]*$
param: customDraw    bool    true
################################################################################
// Date: $now$
// Author: $username$ on $computername$

include "lib://game2d/scene.ms"

class $className$ : Scene
{
    function init()
    {
        super.init();
        // add sprites, layers, etc...
    }

    function enter()
    {
        super.enter();
        // restore state, update UI, etc...
    }

    function exit()
    {
        super.exit();
        // save state, etc...
    }

$if(customDraw)$
    function draw(canvas)
    {
        // custom drawings

        // call (optional) default drawings
        super.draw(canvas);
    }

$endif$
}