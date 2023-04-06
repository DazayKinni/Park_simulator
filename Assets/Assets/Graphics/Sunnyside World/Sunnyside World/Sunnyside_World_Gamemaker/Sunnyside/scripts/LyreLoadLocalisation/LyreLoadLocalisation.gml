/// Preloads language data to populate the language array with language codes
/// This is a necessary step to ensure that Lyre understands what languages exist in the localisation CSV
/// 
/// @param path

function LyreLoadLocalisation(_path)
{
    static _lyre = __Lyre();
    
    __LyreError("TODO");
    
    _lyre.__localisationCSVPath = _path;
    _lyre.__preloadedLocalisation = true;
}