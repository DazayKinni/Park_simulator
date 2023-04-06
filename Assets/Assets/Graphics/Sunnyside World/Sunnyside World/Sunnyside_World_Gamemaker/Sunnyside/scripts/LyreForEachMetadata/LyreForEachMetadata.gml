/// Executes a method for each piece of metadata loaded from the source CSV
/// This is useful to, for example, format metadata before use elsewhere
/// 
/// The method is executed with two arguments:
/// - argument0 is the key for the metadata
/// - argument1 is the metadata array itself
/// 
/// Strings that are have no metadata assigned to them are skipped.
/// 
/// N.B. This is a slow function so use sparingly!
/// 
/// @param method

function LyreForEachMetadata(_method)
{
    static _lyre = __Lyre();
    var _metadataStruct = _lyre.__metadataStruct;
    
    var _namesArray = variable_struct_get_names(_metadataStruct);
    var _i = 0;
    repeat(array_length(_namesArray))
    {
        var _key = _namesArray[_i];
        _method(_key, _metadataStruct[$ _key]);
        ++_i;
    }
}