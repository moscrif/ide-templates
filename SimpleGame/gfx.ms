/**
This class manages graphical resources such as bitmaps, vectors etc.
*/
class GFX
{
    const root = "app://gfx/";

    var background;
    var box;

    function load()
    {
        background = Bitmap.fromFile(root + "background.jpg");
        box = Bitmap.fromFile(root + "sprite.png");
    }
}