/// @param name
/// @param metadata

function __VaultClass(_name, _metadata) constructor
{
    __VaultInitialize();
    array_push(global.__vaultArray, self);
    global.__vaultDict[$ _name] = self;
    
    __name     = _name;
    __metadata = _metadata;
    __data     = undefined;
    __changed  = false;
    
    
    
    static SetMetadata = function(_path)
    {
        __metadata = _path;
        
        return self;
    }
    
    static GetMetadata = function()
    {
        return __metadata;
    }
    
    static SetChanged = function(_state)
    {
        __changed = _state;
        return self;
    }
    
    static GetChanged = function()
    {
        var _changed = __changed;
        __changed = false;
        
        return _changed;
    }
    
    static ClearData = function()
    {
        if (__data != undefined)
        {
            __data = undefined;
            SetChanged(true);
        }
        
        return self;
    }
    
    static SetData = function(_data)
    {
        __data = _data;
        SetChanged(true);
        return self;
    }
    
    static GetData = function()
    {
        return __data;
    }
}