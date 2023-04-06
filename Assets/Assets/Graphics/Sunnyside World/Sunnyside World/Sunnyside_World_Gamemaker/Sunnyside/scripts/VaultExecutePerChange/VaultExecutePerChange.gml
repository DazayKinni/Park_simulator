/// @param callback

function VaultExecutePerChange(_callback)
{
    var _i = 0;
    repeat(array_length(global.__vaultArray))
    {
        if (global.__vaultArray[_i].GetChanged()) _callback(global.__vaultArray[_i]);
        ++_i;
    }
}