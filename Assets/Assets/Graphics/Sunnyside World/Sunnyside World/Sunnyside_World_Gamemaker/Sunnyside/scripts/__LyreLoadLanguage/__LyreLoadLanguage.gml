/// @param path
/// @param languageCode

function __LyreLoadLanguage(_path, _languageCode)
{
    static _lyre = __Lyre();
    
    if (!_lyre.__preloadedLocalisation)
    {
        __LyreError("Must load localisation first using LyreLoadLocalisation()");
        return;
    }
    
    __LyreError("TODO");
}