if ( instance_number(obj_menu_controller) > 1 ) 
{
	instance_destroy();
	exit;
}

enum MENU_EVENT	//enums the user events for menu system
{
	METHODS		= 0,
	DRAWCALLS	= 1,
	ONCLICK		= 10,
}

enum MENUPAGE { TITLE, CONTENTS, GALLERY, PLAY, SETTINGS, GOTO, GAME, PAUSE }

#macro MENUOBJ obj_menu_controller

galleryAddSlide = function(_sprite_id) constructor
{
	index = _sprite_id;
	scale = max( DISPLAY.GetGuiWidth()/sprite_get_width(_sprite_id), DISPLAY.GetGuiHeight()/sprite_get_height(_sprite_id) );
}

//image gallery
gallery = [];
array_push( gallery, new galleryAddSlide( img_gallery_default ) );

galleryIndex = irandom(array_length(gallery)-1);
galleryShowSlideAsBackground = true;

event_user(MENU_EVENT.DRAWCALLS);		//set up drawcalls
event_user(MENU_EVENT.METHODS)			// set up object methods

///page navigation
global.menuPageArray = [];
Menu_SetPage( MENUPAGE.CONTENTS );
global.nextRoom = undefined;