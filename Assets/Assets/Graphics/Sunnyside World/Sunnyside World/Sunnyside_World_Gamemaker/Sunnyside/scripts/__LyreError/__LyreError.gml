function __LyreError()
{
    var _string = "";
    
    var _i = 0
    repeat(argument_count)
    {
        _string += string(argument[_i]);
        ++_i;
    }
    
    show_debug_message("Lyre " + __LYRE_VERSION + ": " + string_replace_all(_string, "\n", "\n          "));
    show_error("Lyre:\n" + _string + "\n ", true);
}