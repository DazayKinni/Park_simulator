/// Returns the number of languages found in the localisation CSV file, plus one for the source language

function LyreGetLanguageCount()
{
    return array_length(LyreGetLanguageCodeArray());
}