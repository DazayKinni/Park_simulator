/// @param textureGroup
/// @param [textureGroup...]
function TexanFlush() {

	var _i = 0;
	repeat(argument_count)
	{
	    var _texture_group = argument[_i];
    
	    if (global.__TexanDebugLevel >= 2) Trace("Texan: Trying to queue flush \"", _texture_group, "\"          ", debug_get_callstack());
    
	    if ((ds_list_find_index(global.__TexanFetch, _texture_group) < 0)
	    &&  (ds_list_find_index(global.__TexanFlush, _texture_group) < 0))
	    {
	        if (global.__TexanDebugLevel >= 2) Trace("Texan: Queued flush for \"", _texture_group, "\"");
	        ds_list_add(global.__TexanFlush, argument[_i]);
	    }
    
	    ++_i;
	}


}
