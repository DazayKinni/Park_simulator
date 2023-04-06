function shader_set_custom(_shader)
{
    static _state = __better_shader_state();
    
    if (BETTER_SHADER_API_FORCE_USAGE && !_state.__exception)
    {
        show_error("Better Shader API:\nUse shader_push() instead of shader_set()\n ", true);
    }
    
    with(_state)
    {
        if (__current != _shader)
        {
            __shader_set__(_shader);
            array_resize(__stack, 1);
            __stack[@ 0] = _shader;
            __current = _shader;
        
            if (BETTER_SHADER_API_ALLOW_DEBUG && __debug_level) show_debug_message("Shader force set to \"" + shader_get_name(_shader) + "\"          " + string(debug_get_callstack()) + "          " + string(__stack));
        }
    }
}
