function UICreate_Header(_x,_y, _locKey)
{
	var _inst = instance_create_depth( _x, _y, 0, obj_menu_header );
	_inst.locKey = _locKey;
	
	return _inst;
}