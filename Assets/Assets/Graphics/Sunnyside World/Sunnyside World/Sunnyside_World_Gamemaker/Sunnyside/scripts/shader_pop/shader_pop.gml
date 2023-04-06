function shader_pop()
{
    static _state = __better_shader_state();
    with(_state)
    {
        array_pop(__stack);
        var _shader = (array_length(__stack) <= 0)? -1 : __stack[0];
        
        if (BETTER_SHADER_API_ALLOW_DEBUG && (__debug_level == 2)) show_debug_message("Popped shader stack to \"" + ((_shader < 0)? "<native>" : shader_get_name(_shader)) + "\"          " + string(debug_get_callstack()) + "          " + string(__stack));
        
        if (__current != _shader)
        {
            if (_shader < 0)
            {
                if (BETTER_SHADER_API_ALLOW_DEBUG && __debug_level) show_debug_message("Shader popped to native          " + string(debug_get_callstack()));
                __shader_reset__();
            }
            else
            {
                if (BETTER_SHADER_API_ALLOW_DEBUG && __debug_level) show_debug_message("Shader popped to \"" + shader_get_name(_shader) + "\"          " + string(debug_get_callstack()) + "          " + string(__stack));
                __shader_set__(_shader);
            }
            
            __current = _shader;
        }
    }
}
