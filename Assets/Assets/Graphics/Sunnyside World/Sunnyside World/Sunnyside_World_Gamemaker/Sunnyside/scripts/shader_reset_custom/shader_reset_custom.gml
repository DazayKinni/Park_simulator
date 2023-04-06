function shader_reset_custom()
{
    static _state = __better_shader_state();
    
    if (BETTER_SHADER_API_FORCE_USAGE && !_state.__exception)
    {
        show_error("Better Shader API:\nUse shader_pop() instead of shader_reset()\n ", true);
    }
    
    with(_state)
    {
        if (__current != -1)
        {
            __shader_reset__();
            array_resize(__stack, 0);
            __current = -1;
        
            if (BETTER_SHADER_API_ALLOW_DEBUG && __debug_level) show_debug_message("Shader force reset          " + string(debug_get_callstack()) + "          " + string(__stack));
        }
    }
}