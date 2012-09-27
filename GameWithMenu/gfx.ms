/**
This class manages graphical resources such as bitmaps, vectors etc.
*/
class GFX
{
    const root = "app://gfx/";

    var background;
    var disk;

    function load()
    {
        background = Bitmap.fromFile(root + "background.jpg");
        disk = Bitmap.fromFile(root + "disk.png");
    }
}