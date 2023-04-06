function Button_QuitApp()
{
	game_end();
}

function Button_QuitLevel()
{
	Menu_SetPage( MENUPAGE.GOTO );
	global.nextRoom = rm_menu;
}

function Button_Pause()
{
	Game_SetPaused(true);
	Menu_SetPage( MENUPAGE.PAUSE );
}

//work on contents page
function Button_Rooms()
{
	Menu_SetPage( MENUPAGE.PLAY );
}

function Button_Settings()
{
	Menu_SetPage( MENUPAGE.SETTINGS );
}

function Button_Gallery()
{
	Menu_SetPage(MENUPAGE.GALLERY);
}

//works with level select buttons
function Button_ChooseLevel()
{
	global.nextRoom = targetRoom;
	Menu_SetPage(MENUPAGE.GOTO);
}

//work with the settings slider
function Button_IncrementSlider()
{
	var _dir = image_xscale;
	with ( parent )
	{
		fillFactor += sliderInc*_dir;
		fillFactor = clamp(fillFactor,0,1);
		fillWidth = remainingWidth*fillFactor;
		Trace( "Setting slider ", locKey, " set to ", fillFactor );
	}
	script_execute(parent.scriptOnPress);
}

//works on the gallery page
function Button_GalleryChangeSlide()
{
	transform.Repeat();
	var _dir = image_xscale;
	
	//set the next gallery image index
	with ( MENUOBJ )
	{
		var _index = galleryIndex, _len = array_length(gallery);
		_index += _dir;
		
		if ( _index < 0 ) _index = _len-1;
		else if ( _index >= _len ) _index = 0;
		
		galleryIndex = _index;
		Trace( "Gallery: slide index set to ", galleryIndex, " < ", sprite_get_name(gallery[_index].index)," >" );
	}
	
	//reset the gallery object
	with ( obj_menu_gallery )
	{
		sprite_index = MENUOBJ.gallery[_index].index;
		scaleFrom = MENUOBJ.gallery[_index].scale;
		scaleTo = scaleFrom*1.05
		timer = 0;
	}
}

//works with the debug button
function Button_EnableDebug()
{
	global.debugState = !global.debugState;
	HitflashAddSafe(id,5);
}