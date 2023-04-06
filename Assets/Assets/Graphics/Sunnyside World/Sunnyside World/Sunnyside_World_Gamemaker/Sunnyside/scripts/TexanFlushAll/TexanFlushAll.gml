function TexanFlushAll() {
	var _i = 0;
	repeat(ds_list_size(global.__TexanTextureGroups))
	{
	    TexanFlush(global.__TexanTextureGroups[| _i]);
	    ++_i;
	}


}
