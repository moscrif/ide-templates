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
        background = Bitmap.fromFile(root + "background.jpg").resize(System.width + 1, System.height + 1);
        box = Bitmap.fromFile(root + "sprite.png");
    }
}