/// @param textureGroup
/// @param [textureGroup...]
function TexanAlwaysFetch() {

	var _i = 0;
	repeat(argument_count)
	{
	    var _texture_group = argument[_i];
    
	    if (ds_list_find_index(global.__TexanAlwaysFetch, _texture_group) < 0)
	    {
	        if (global.__TexanDebugLevel >= 1) Trace("Texan: Always fetching \"", _texture_group, "\"");
	        ds_list_add(global.__TexanAlwaysFetch, _texture_group);
	        TexanFetch(_texture_group);
	    }
    
	    ++_i;
	}


}
