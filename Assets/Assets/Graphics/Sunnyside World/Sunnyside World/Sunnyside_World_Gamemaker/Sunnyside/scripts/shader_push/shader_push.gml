function shader_push(_shader)
{
    static _state = __better_shader_state();
    with(_state)
    {
        array_push(__stack, _shader);
        if (BETTER_SHADER_API_ALLOW_DEBUG && (__debug_level == 2)) show_debug_message("Pushed shader \"" + shader_get_name(_shader) + "\" to stack          " + string(debug_get_callstack()) + "          " + string(__stack));
        
        if (__current != _shader)
        {
            if (BETTER_SHADER_API_ALLOW_DEBUG && __debug_level) show_debug_message("Shader pushed to \"" + shader_get_name(_shader) + "\"          " + string(debug_get_callstack()) + "          " + string(__stack));
            __shader_set__(_shader);
            __current = _shader;
        }
    }
}
