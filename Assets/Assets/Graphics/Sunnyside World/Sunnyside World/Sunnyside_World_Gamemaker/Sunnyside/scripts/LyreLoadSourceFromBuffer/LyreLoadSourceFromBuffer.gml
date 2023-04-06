/// @param buffer

function LyreLoadSourceFromBuffer(_buffer)
{
    static _lyre = __Lyre();
    
    __LyreTrace("Source CSV from buffer ", _buffer);
    SnapBufferReadBOM(_buffer);
    var _sourceData = SnapBufferReadCSV(_buffer, 0);
    
    __LyreTrace("Found ", array_length(_sourceData), " rows");
    
    if (array_length(_sourceData) <= 0)
    {
        __LyreError("The source CSV contains no data");
    }
    
    var _headerArray = _sourceData[0];
    if (array_length(_headerArray) < 3)
    {
        __LyreError("The source CSV must contain at least three columns");
    }
    
    if (string_lower(_headerArray[0]) != "comments")
    {
        __LyreError("The second column in the source CSV must be named \"Comments\"");
    }
    
    if (string_lower(_headerArray[1]) != "key")
    {
        __LyreError("The second column in the source CSV must be named \"Key\"");
    }
    
    var _sourceStringStruct = {};
    var _metadataStruct     = {};
    _lyre.__sourceStringStruct = _sourceStringStruct;
    _lyre.__metadataStruct     = _metadataStruct;
    
    __LyreTrace("Found ", array_length(_sourceData[0]), " columns");
    
    var _metadataSize = array_length(_sourceData[0]) - __LYRE_METADATA_OFFSET;
    __LyreTrace("Metadata will have ", _metadataSize, " elements");
    var _metadataArray = array_create(_metadataSize, undefined);
    
    var _y = 1;
    repeat(array_length(_sourceData)-1)
    {
        var _rowArray = _sourceData[_y];
        
        var _key = _rowArray[1];
        if (_key != "")
        {
            var _sourceString = _rowArray[2];
            _sourceStringStruct[$ _key] = _sourceString;
            
            var _anyMetadata = false;
            
            var _x = 0;
            repeat(min(_metadataSize, array_length(_rowArray) - __LYRE_METADATA_OFFSET))
            {
                var _metadata = _rowArray[_x + __LYRE_METADATA_OFFSET];
                if (_metadata != "")
                {
                    _anyMetadata = true;
                    _metadataArray[@ _x] = _metadata;
                }
                
                ++_x;
            }
            
            if (_anyMetadata)
            {
                _metadataStruct[$ _key] = _metadataArray;
                _metadataArray = array_create(_metadataSize, undefined);
            }
        }
        
        ++_y;
    }
    
    var _defaultLanguageCode = _headerArray[2];
    _lyre.__defaultLanguageCode = _defaultLanguageCode;
    __LyreTrace("Default language code is \"", _defaultLanguageCode, "\"");
    
    var _index = LyreGetLanguageCodeIndex(_defaultLanguageCode);
    if (is_numeric(_index)) array_delete(LyreGetLanguageCodeArray(), _index, 1);
    array_insert(LyreGetLanguageCodeArray(), 0, _defaultLanguageCode);
    
    //Re-set the language code to update the current string struct
    var _oldLanguageCode = _lyre.__languageCode;
    _lyre.__languageCode = undefined;
    LyreSetLanguageCode(_oldLanguageCode ?? _defaultLanguageCode);
}