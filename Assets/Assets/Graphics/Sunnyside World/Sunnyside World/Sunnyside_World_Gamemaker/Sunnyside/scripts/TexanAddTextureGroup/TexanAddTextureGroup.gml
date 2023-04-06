/// @param textureGroup
/// @param [textureGroup...]
function TexanAddTextureGroup() {

	var _i = 0;
	repeat(argument_count)
	{
	    var _texture_group = argument[_i];
    
	    if (ds_list_find_index(global.__TexanTextureGroups, _texture_group) < 0)
	    {
	        if (global.__TexanDebugLevel >= 1) Trace("Texan: Adding texture group \"", _texture_group, "\"");
	        ds_list_add(global.__TexanTextureGroups, _texture_group);
        
	        var _sprites = texturegroup_get_sprites(_texture_group);
	        var _s = 0;
	        repeat(array_length_1d(_sprites))
	        {
	            var _sprite = _sprites[_s];
	            if (global.__TexanDebugLevel >= 2) Trace("Texan: \"", _texture_group, "\" has sprite ", sprite_get_name(_sprite), " (", _sprite, ")");
	            global.__TexanSpriteToTextureGroup[? _sprite] = _texture_group;
	            ++_s;
	        }
	    }
    
	    ++_i;
	}


}
