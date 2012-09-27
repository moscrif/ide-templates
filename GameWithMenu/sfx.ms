/**
This class manages sounds and musics
*/
class SFX
{
    const root = "app://sfx/";

    var click;

    function load()
    {
        click = new AudioPlayer();
        click.openFile(root + "strikeball.wav");
    }

    function playClick()
    {
        click.play();
    }

}