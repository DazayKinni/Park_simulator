function __better_shader_state()
{
    static _struct = {
        __debug_level: 0,
        __current:    -1,
        __stack:      [],
        __exception:  false,
    };
    
    return _struct;
}