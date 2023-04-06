function UICreate_SettingsButton(_locKey,_x,_y)
{
	var _inst = instance_create_depth(_x,_y,0,obj_ui_button_menu_settings);
	with (_inst)
	{
		locKey = _locKey;
	}
	
	return _inst;
}