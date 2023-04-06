function shader_reset_exception()
{
    static _state = __better_shader_state();
    _state.__exception = false;
}