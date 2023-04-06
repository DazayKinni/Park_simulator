#macro VAULT  global.__vaultDict

function __VaultInitialize()
{
    static _initialized = false;
    if (_initialized) return;
    _initialized = true;
    
    global.__vaultDict  = {};
    global.__vaultArray = [];
    
    global.__vaultShortcutDict = {};
}