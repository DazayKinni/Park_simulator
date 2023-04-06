/// @param value

function TraceCallstack() 
{
	var _string = "";
    
	var _i = 0;
	repeat(argument_count)
	{
	    _string += string(argument[_i]);
	    ++_i;
	}
    
    if (SHOW_CALLSTACK) _string += "          " + string(debug_get_callstack());
    
	show_debug_message(_string);
	return _string;
}