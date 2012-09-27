/**
This class manages sounds and musics
*/
class SFX
{
    const root = "app://sfx/";

    var click;
    var music;

    function load()
    {
        click = new AudioPlayer();
        click.openFile(root + "stone.wav");

        music = new AudioPlayer();
        music.openFile(root + "music.mp3");
    }

    function playClick()
    {
        click.play();
    }

    function playMusic()
    {
        music.play();
    }

    function stopMusic()
    {
        music.pause();
    }

}