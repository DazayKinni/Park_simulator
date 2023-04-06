/// Returns the index of the given language code
/// If the language code was not found, this function returns <undefined>
/// DO NOT USE THIS INDEX TO SAVE WHAT LANGUAGE A PLAYER IS USING; save the language code instead
/// 
/// @param languageCode

function LyreGetLanguageCodeIndex(_languageCode)
{
    var _array = LyreGetLanguageCodeArray();
    
    var _i = 0;
    repeat(array_length(_array))
    {
        if (_array[_i] == _languageCode)
        {
            return _i;
        }
        
        ++_i;
    }
    
    return undefined;
}