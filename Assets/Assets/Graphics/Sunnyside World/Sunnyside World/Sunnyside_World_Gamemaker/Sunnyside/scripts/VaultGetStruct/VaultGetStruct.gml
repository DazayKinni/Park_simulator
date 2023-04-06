/// @param name

function VaultGetStruct(_name)
{
    if (!variable_struct_exists(global.__vaultDict, _name)) __VaultError("Vault \"", _name, "\" doesn't exist");
    return global.__vaultDict[$ _name];
}