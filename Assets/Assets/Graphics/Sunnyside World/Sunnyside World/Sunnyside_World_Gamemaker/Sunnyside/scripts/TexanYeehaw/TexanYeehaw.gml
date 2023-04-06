function TexanYeehaw() {
	if (global.__TexanDebugLevel >= 1) Trace("Texan: Handling flush/fetch queues");

	var _i = 0;
	repeat(ds_list_size(global.__TexanFlush))
	{
	    var _texture_group = global.__TexanFlush[| _i];
	    texture_flush(_texture_group);
	    if (global.__TexanDebugLevel >= 1) Trace("Texan: Flushed \"", _texture_group, "\"");
	    ++_i;
	}

	var _i = 0;
	repeat(ds_list_size(global.__TexanFetch))
	{
	    var _texture_group = global.__TexanFetch[| _i];
    
	    var _t = get_timer();
	    texture_prefetch(_texture_group);
    
	    if ((global.__TexanDebugLevel >= 1) && (get_timer() - _t > 1000))
	    {
	        Trace("Texan: Fetched \"", _texture_group, "\"");
	    }
	    else if (global.__TexanDebugLevel >= 2)
	    {
	        Trace("Texan: Fetched \"", _texture_group, "\" (but it was probably already loaded)");
	    }
    
	    ++_i;
	}

	ds_list_clear(global.__TexanFlush);
	ds_list_clear(global.__TexanFetch);

	ds_list_copy(global.__TexanFetch, global.__TexanAlwaysFetch);


}
