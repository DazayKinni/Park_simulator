/// @param textureGroup
/// @param [textureGroup...]
function TexanFetch() {

	var _i = 0;
	repeat(argument_count)
	{
	    var _texture_group = argument[_i];
    
	    if (global.__TexanDebugLevel >= 2) Trace("Texan: Trying to queue fetch \"", _texture_group, "\"          ", debug_get_callstack());
    
	    var _index = ds_list_find_index(global.__TexanFlush, _texture_group);
	    if (_index >= 0)
	    {
	        if (global.__TexanDebugLevel >= 2) Trace("Texan: Fetch collides with flush for \"", _texture_group, "\", removing flush");
	        ds_list_delete(global.__TexanFlush, _index);
	    }
    
	    if (ds_list_find_index(global.__TexanFetch, _texture_group) < 0)
	    {
	        if (global.__TexanDebugLevel >= 2) Trace("Texan: Queued fetch for \"", _texture_group, "\"");
	        ds_list_add(global.__TexanFetch, _texture_group);
	    }
    
	    ++_i;
	}


}
