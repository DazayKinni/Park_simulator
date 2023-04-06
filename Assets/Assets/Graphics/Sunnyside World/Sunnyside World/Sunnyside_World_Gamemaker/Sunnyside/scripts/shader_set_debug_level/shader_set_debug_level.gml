/// @param level

function shader_set_debug_level(_level)
{
    static _state = __better_shader_state();
    _state.__debug_level = _level;
}