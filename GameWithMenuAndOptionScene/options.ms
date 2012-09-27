// "static" class that provides basic functionality for "Options" used in 2d game development
class Options
{
    // @region All these class variables will be serialized

    var level = 0;
    var musics = true;
    var sounds = true;

    // @endregion

    // @region Static functions

    // Static function that saves options to file (json)
    function save()
    {
        // rewrite file
        var file = Stream.openFile("data://settings.dat", "w+");
        if (!file) {
            logE("Unable to create settings file!");
            return;
        }
        // create pure object without functions (pure object)
        var options =  {};
        for (var opt in Options)
            if (typeof Options[opt] != #function)   // skip functions
                options[opt] = Options[opt]         // create new attribute with value
        file.printf("%V", options);                 // formatted print to file
        file.close();                               // close and release
    }

    // Static function that loads options from file (json)
    function load()
    {
        // open file for reading
        var file = Stream.openFile("data://settings.dat", "r");
        if (!file) {
            logW("Unable to load settings file!");
            return;
        }
        var options = parseData(file);              // load data to json
        file.close();                               // close file
        for (var opt in options)                    // iterate all attributes
            Options[opt] = options[opt];            // apply to class
    }

    // @endregion
}