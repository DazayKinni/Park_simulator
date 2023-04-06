function Menu_SetPage(_target,_back=false)
{
	//destroy non-persistent menu objects
	with ( obj_menu_par ) 
	{
		if ( !persistent ) instance_destroy();	
	}
	
	if (!_back) array_push(global.menuPageArray,_target);
	
	var _obj, _str;
	
	switch ( _target )
	{
		case MENUPAGE.TITLE :
			_obj = obj_menu_gametitle;
			_str = "MENUPAGE.TITLE";
		break;
		
		case MENUPAGE.CONTENTS :
			_obj = obj_menu_contents;
			_str = "MENUPAGE.CONTENTS";
		break;
		
		case MENUPAGE.GALLERY :
			_obj = obj_menu_gallery;
			_str = "MENUPAGE.GALLERY";
		break;
		
		case MENUPAGE.PLAY :
			_obj = obj_menu_rooms;
			_str = "MENUPAGE.PLAY";
		break;
		
		case MENUPAGE.SETTINGS :
			_obj = obj_menu_settings;
			_str = "MENUPAGE.SETTINGS";
		break;
		
		case MENUPAGE.GOTO :
			_obj = obj_menu_goto;
			_str = "MENUPAGE.PLAY";
		break;
		
		case MENUPAGE.GAME :
			_obj = obj_menu_game;
			_str = "MENUPAGE.GAME";
		break;
		
		case MENUPAGE.PAUSE :
			_obj = obj_menu_pause;
			_str = "MENUPAGE.PAUSE";
		break;
	}
	
	Trace( "Menu_SetPage() changed page to ", _str, " (", _target, ")" );
	
	var _inst = instance_create_depth(0,0,0,_obj);
	
	return _inst;
}

function Menu_PageBack()
{
	array_pop( global.menuPageArray );
	Menu_SetPage( global.menuPageArray[array_length(global.menuPageArray)-1], true );
}