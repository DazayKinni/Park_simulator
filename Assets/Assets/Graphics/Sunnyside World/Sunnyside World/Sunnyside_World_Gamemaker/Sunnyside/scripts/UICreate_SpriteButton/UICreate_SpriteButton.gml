function UICreate_SpriteButton(_x,_y,_sprite)
{
	var _inst = instance_create_depth(_x,_y,0,obj_ui_button_menu_sprite);
	with _inst
	{
		sprite_index = _sprite;
		boxW = sprite_width;
		boxH = sprite_height;
		SetCoords()
	}
	return _inst;
}