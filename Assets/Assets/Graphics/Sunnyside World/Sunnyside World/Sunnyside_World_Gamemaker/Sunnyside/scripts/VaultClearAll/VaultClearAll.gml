function VaultClearAll()
{
    var _i = 0;
    repeat(array_length(global.__vaultArray))
    {
        global.__vaultArray[_i].ClearData();
        ++_i;
    }
}