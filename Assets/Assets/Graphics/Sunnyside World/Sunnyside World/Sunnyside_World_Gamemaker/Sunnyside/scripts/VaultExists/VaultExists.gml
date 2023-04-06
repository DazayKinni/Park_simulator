/// @param vaultName
/// @param key
/// @param ...

function VaultExists(_vaultName)
{
    static _keyArray = []; //Don't reallocate this every time
    var _keyCount = 0;
    
    var _vault = is_struct(_vaultName)? _vaultName : global.__vaultDict[$ _vaultName];
    if (is_struct(_vault))
    {
        //Copy the arguments over to the key array
        var _i = 1;
        repeat(argument_count-1)
        {
            _keyArray[@ _i-1] = argument[_i];
            ++_i;
        }
        
        _keyCount = argument_count-1;
    }
    else
    {
        var _shortcutArray = global.__vaultShortcutDict[$ _vaultName];
        
        if (!is_array(_shortcutArray)) return false;
        
        _vault = global.__vaultDict[$ _vaultName];
        if (!is_struct(_vault)) return false;
        
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
        var _j = 1;
        repeat(argument_count-1)
        {
            _keyArray[@ _i] = argument[_j];
            ++_i;
            ++_j;
        }
        
        _keyCount = (array_length(_shortcutArray)-1) + (argument_count-1);
    }
    
    with(_vault)
    {
        var _node = __data;
        if (_node == undefined) return false;
        
        var _i = 0;
        repeat(_keyCount)
        {
            var _key = _keyArray[_i];
            
            if (is_string(_key))
            {
                if (!is_struct(_node))
                {
                    __VaultError("Key provided is a string (", _key, ") but current data structure is not a struct");
                }
                
                if (!variable_struct_exists(_node, _key)) return false;
                
                _node = _node[$ _key];
            }
            else if (is_numeric(_key))
            {
                if (!is_array(_node))
                {
                    __VaultError("Key provided is a number (", _key, ") but current data structure is not an array");
                }
                
                if (_key < 0)
                {
                    __VaultError("Array index is less than 0 (", _key, ")");
                }
                
                if (_key >= array_length(_node)) return false;
                
                _node = _node[_key];
            }
            else
            {
                __VaultError("Key must be a string (struct access) or a number (array access)\nKey was ", typeof(_key));
            }
        
            ++_i;
        }
        
        return true;
    }
}