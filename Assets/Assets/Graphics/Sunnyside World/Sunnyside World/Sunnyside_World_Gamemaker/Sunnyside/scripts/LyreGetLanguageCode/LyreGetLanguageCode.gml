/// Returns the currently selected language code

function LyreGetLanguageCode()
{
    static _lyre = __Lyre();
    return _lyre.__languageCode;
}