/// @param vaultName
/// @param default
/// @param key
/// @param ...

function VaultRead(_vaultName, _default)
{
    static _keyArray = []; //Don't reallocate this every time
    var _keyCount = 0;
    
    var _vault = is_struct(_vaultName)? _vaultName : global.__vaultDict[$ _vaultName];
    if (is_struct(_vault))
    {
        if (argument_count < 3) __VaultError("Incorrect number of arguments (got ", argument_count, ", was expecting at least 3)");
        
        //Copy the arguments over to the key array
        var _i = 2;
        repeat(argument_count-2)
        {
            _keyArray[@ _i-2] = argument[_i];
            ++_i;
        }
        
        _keyCount = argument_count-2;
    }
    else
    {
        var _shortcutArray = global.__vaultShortcutDict[$ _vaultName];
        
        if (!is_array(_shortcutArray)) __VaultError("No vault or shortcut called \"", _vaultName, "\" exists");
        
        _vault = global.__vaultDict[$ _shortcutArray[0]];
        if (!is_struct(_vault)) __VaultError("No vault called \"", _shortcutArray[0], "\" exists (shortcut = \"", _vaultName, "\")");
        
        if (argument_count < 2) __VaultError("Incorrect number of arguments (got ", argument_count, ", was expecting at least 2 for shortcut use)");
        
        //Copy the shortcut keys
        var _i = 0;
        var _j = 1;
        repeat(array_length(_shortcutArray)-1)
        {
            _keyArray[@ _i] = _shortcutArray[_j];
            ++_i;
            ++_j;
        }
        
        //Copy the arguments over to the key array too
        var _j = 2;
        repeat(argument_count-2)
        {
            _keyArray[@ _i] = argument[_j];
            ++_i;
            ++_j;
        }
        
        _keyCount = (array_length(_shortcutArray)-1) + (argument_count-2);
    }
    
    with(_vault)
    {
        var _value = __data;
        if (_value == undefined) return _default;
        
        var _i = 0;
        repeat(_keyCount)
        {
            var _key = _keyArray[_i];
            
            if (is_string(_key))
            {
                if (!is_struct(_value))
                {
                    __VaultError("Key provided is a string (", _key, ") but current data structure is not a struct");
                }
                
                if (!variable_struct_exists(_value, _key)) return _default;
                
                _value = _value[$ _key];
            }
            else if (is_numeric(_key))
            {
                if (!is_array(_value))
                {
                    __VaultError("Key provided is a number (", _key, ") but current data structure is not an array");
                }
                
                if (_key < 0)
                {
                    __VaultError("Array index is less than 0 (", _key, ")");
                }
                
                if (_key >= array_length(_value)) return _default;
                
                _value = _value[_key];
            }
            else
            {
                __VaultError("Key must be a string (struct access) or a number (array access)\nKey was ", typeof(_key));
            }
            
            ++_i;
        }
        
        return _value;
    }
}