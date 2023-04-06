/// @param vaultName
/// @param value
/// @param key
/// @param ...

function VaultWrite(_vaultName, _setValue)
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
        var _node = __data;
        if (_node == undefined)
        {
            if (is_string(_keyArray[0]))
            {
                _node = {};
            }
            else if (is_numeric(_keyArray[0]))
            {
                _node = [];
            }
            else
            {
                __VaultError("Keys must be strings (struct access) or numbers (array access)\nKey was ", typeof(_keyArray[0]));
            }
            
            __data = _node;
        }
        
        var _changed = false;
        
        var _i = 0;
        repeat(_keyCount)
        {
            var _oldNode = _node;
            var _key = _keyArray[_i];
            
            if (is_string(_key))
            {
                if (!is_struct(_node)) __VaultError("Key provided is a string (", _key, ") but current data structure is not a struct");
                
                if (variable_struct_exists(_node, _key))
                {
                    if (_i >= _keyCount-1)
                    {
                        //Final key, write to the struct
                        if (_node[$ _key] != _setValue) _changed = true;
                        _node[$ _key] = _setValue;
                    }
                    else
                    {
                        _node = _node[$ _key];
                    }
                }
                else
                {
                    //Adding a new key
                    
                    if (_i >= _keyCount-1)
                    {
                        //Final key, write to the struct
                        if (_node[$ _key] != _setValue)
                        {
                            _node[$ _key] = _setValue;
                            _changed = true;
                        }
                    }
                    else if (is_string(_keyArray[_i+1]))
                    {
                        _changed = true;
                        _node = {};
                        _oldNode[$ _key] = _node;
                    }
                    else if (is_numeric(_keyArray[_i+1]))
                    {
                        _changed = true;
                        _node = [];
                        _oldNode[$ _key] = _node;
                    }
                    else
                    {
                        __VaultError("Key must be a string (struct access) or a number (array access)\nKey was ", typeof(_key));
                    }
                }
            }
            else if (is_numeric(_key))
            {
                if (!is_array(_node)) __VaultError("Key provided is a number (", _key, ") but current data structure is not an array");
                
                if (_key < 0) __VaultError("Array index is less than 0 (", _key, ")");
                
                if (_key < array_length(_node))
                {
                    if (_i >= _keyCount-1)
                    {
                        //Final key, write to the array
                        if (_node[@ _key] != _setValue)
                        {
                            _node[@ _key] = _setValue;
                            _changed = true;
                        }
                    }
                    else
                    {
                        _node = _node[_key];
                    }
                }
                else
                {
                    //Adding a new key
                    
                    var _oldSize = array_length(_node);
                    if (_oldSize < _key+1)
                    {
                        _changed = true;
                        array_resize(_node, _key+1);
                        
                        var _j = _oldSize;
                        repeat(_key - _j)
                        {
                            _node[@ _j] = undefined;
                            ++_j;
                        }
                    }
                    else
                    {
                        if (_i >= _keyCount-1)
                        {
                            if (_node[_key] != _setValue) _changed = true;
                        }
                    }
                    
                    if (_i >= _keyCount-1)
                    {
                        _node[@ _key] = _setValue;
                    }
                    else
                    {
                        if (is_string(_keyArray[_i+1]))
                        {
                            _changed = true;
                            _node = {};
                            _oldNode[@ _key] = _node;
                        }
                        else if (is_numeric(_keyArray[_i+1]))
                        {
                            _changed = true;
                            _node = [];
                            _oldNode[@ _key] = _node;
                        }
                        else
                        {
                            __VaultError("Key must be a string (struct access) or a number (array access)\nKey was ", typeof(_key));
                        }
                    }
                }
            }
            else
            {
                __VaultError("Key must be a string (struct access) or a number (array access)\nKey was ", typeof(_key));
            }
            
            ++_i;
        }
        
        if (is_struct(_setValue) || is_array(_setValue)) _changed = true;
        if (_changed) SetChanged(true);
    }
}