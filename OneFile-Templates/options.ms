type: moscrif source code
name: Options
description: Option class for games
author: Jozef Prídavok and Moscrif 2010-2012
param: className		text	Options	^[a-zA-Z_][a-zA-Z0-9_]*$
param: optionsFileName	text	settings.dat
param: implementLoading	bool	true
param: implementSaving	bool	true
################################################################################
// "static" class that provides basic functionality for "Options"
class $className$
{
    // @region All these class variables will be serialized

    // TODO: add/remove your options here

    var level = 0;
    var musics = true;
    var sounds = true;
    
    // @endregion

    // @region Static functions

$if(implementSaving)$
    // Static function that saves options to file (json)
    function save()
    {
        // rewrite file
        var file = Stream.openFile("data://$optionsFileName$", "w+");
        if (!file) {
            logE("Unable to create settings file!");
            return;
        }
        // create pure object without functions (pure object)
        var options =  {};
        for (var opt in $className$)
            if (typeof $className$[opt] != #function)   // skip functions
                options[opt] = $className$[opt]         // create new attribute with value
        file.printf("%V", options);                     // formatted print to file
        file.close();                                   // close and release
    }    
$endif$

$if(implementLoading)$
    // Static function that loads options from file (json)
    function load()
    {
        // open file for reading
        var file = Stream.openFile("data://$optionsFileName$", "r");
        if (!file) {
            logW("Unable to load settings file!");
            return;
        }
        var options = parseData(file);                  // load data to json
        file.close();                                   // close file
        for (var opt in options)                        // iterate all attributes
            $className$[opt] = options[opt];            // apply to class
    }
$endif$

    // @endregion
}