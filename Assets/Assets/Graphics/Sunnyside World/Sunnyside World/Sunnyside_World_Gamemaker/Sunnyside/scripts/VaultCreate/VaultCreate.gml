/// @param name
/// @param metadata

function VaultCreate(_name, _metadata)
{
    __VaultInitialize();
    
    if (variable_struct_exists(global.__vaultShortcutDict, _name))
    {
        __VaultError("Vault name \"", _name, "\" conflicts with existing shortcut");
    }
    
    if (string_char_at(_name, 1) == "~")
    {
        __VaultError("Vault names should not start with the ~ character");
    }
    
    return new __VaultClass(_name, _metadata);
}