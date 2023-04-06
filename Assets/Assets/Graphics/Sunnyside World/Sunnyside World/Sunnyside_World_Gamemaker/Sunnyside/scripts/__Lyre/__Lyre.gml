#macro __LYRE_VERSION  "0.0.1"
#macro __LYRE_DATE     "2023-01-20"

__LyreTrace("Welcome to Lyre by @jujuadams! This is version " + __LYRE_VERSION + ", " + __LYRE_DATE);

#macro __LYRE_METADATA_OFFSET  3

function __Lyre()
{
    static _struct = undefined;
    if (_struct == undefined)
    {
        _struct = {
            //Data set using load functions
            __defaultLanguageCode: undefined,
            __sourceStringStruct:  {},
            __metadataStruct:      {},
            
            __preloadedLocalisation: false,
            __localisationCSVPath:   undefined,
            __languageCodeArray:     [],
            
            //Current variables
            __stringStruct: {},
            __languageCode: undefined,
        };
    }
    
    return _struct;
}