/// @param shortcutName
/// @param vaultName
/// @param key
/// @param ...

function VaultCreateShortcut(_shortcutName, _vaultName)
{
    __VaultInitialize();
    
    if (variable_struct_exists(global.__vaultDict, _shortcutName))
    {
        __VaultError("Shortcut name \"", _shortcutName, "\" conflicts with existing vault");
        return;
    }
    
    if (argument_count < 3)
    {
        __VaultError("A shortcut name, vault name, and initial key must be specified");
    }
    
    if (string_char_at(_shortcutName, 1) != "~")
    {
        __VaultError("Shortcut names should start with the ~ character");
    }
    
    var _array = array_create(argument_count-1)
    var _i = 1;
    repeat(argument_count-1)
    {
        var _key = argument[_i];
        if (!is_string(_key) && !is_numeric(_key))
        {
            __VaultError("Key must be a string (struct access) or a number (array access)\nKey was ", typeof(_key), " for shortcut ", _shortcutName);
            return;
        }
        
        _array[@ _i-1] = argument[_i];
        
        ++_i;
    }
    
    global.__vaultShortcutDict[$ _shortcutName] = _array;
}