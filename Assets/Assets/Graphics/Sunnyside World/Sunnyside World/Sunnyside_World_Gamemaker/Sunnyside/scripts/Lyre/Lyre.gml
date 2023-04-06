/// @param key

function Lyre(_key)
{
    static _lyre = __Lyre();
    
    //N.B. The string struct and source struct are NOT static!
    
    var _result = _lyre.__stringStruct[$ _key];
    if (_result == undefined)
    {
        if (LYRE_SHOW_MISSING_KEYS)
        {
            return _key;
        }
        else
        {
            _result = _lyre.__sourceStringStruct[$ _key];
            
            if (_result == undefined)
            {
                return _key;
            }
        }
    }
    
    return _result;
}