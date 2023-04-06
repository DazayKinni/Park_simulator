/// Sets the current language code
/// If the language code cannot be found in the localisation CSV then the source language to set instead, and this function will return <false>
/// 
/// @param languageCode

function LyreSetLanguageCode(_languageCode)
{
    static _lyre = __Lyre();
    
    if (!is_numeric(LyreGetLanguageCodeIndex(_languageCode)))
    {
        __LyreTrace("Warning! Language code ", _languageCode, " not found in localisation CSV");
        LyreSetLanguageCode(LyreGetDefaultLanguageCode());
        return false;
    }
    
    with(_lyre)
    {
        if (__languageCode != _languageCode)
        {
            __LyreTrace("Set language code to \"", _languageCode, "\"");
            __languageCode = _languageCode;
            
            if (__defaultLanguageCode == __languageCode)
            {
                __stringStruct = __sourceStringStruct;
            }
            else
            {
                __LyreLoadLanguage(__localisationCSVPath, __languageCode);
            }
        }
    }
    
    return true;
}