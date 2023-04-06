/// Returns the array of language codes found in the localisation CSV file, plus the source language
/// The source language is always found in the 0th position in the returned array
/// The array that is returned is static and modifying it may have unintended consequences

function LyreGetLanguageCodeArray()
{
    static _array = __Lyre().__languageCodeArray;
    return _array;
}