UI_SetSidePanels(true);


_spacing = 20;		//pixels apart for the contents boxes

array = [];

var _inst = UICreate_PillButton( "contents play", 0, DISPLAY.GetGuiHeight()-203 )
with ( _inst )
{
	SetSound(sfx_ui_click);
	SetDelay(8)
	SetScript( Button_Rooms )
	SetWidthFixed( 420, 0 );
	ScreenAlign(fa_left,40,30);
	SetBlend(c_white,c_black);
	Apply();
}
array_push(array,_inst);



var _inst = UICreate_PillButton( "contents gallery", 0, DISPLAY.GetGuiHeight()-203 )
with ( _inst )
{
	SetSound(sfx_ui_click);
	SetDelay(10)
	SetScript( Button_Gallery )
	SetWidthFixed( 420, 0 );
	ScreenAlign(fa_left,40,30);
	SetBlend(c_white,c_black);
	Apply();
}
array_push(array,_inst);

var _inst = UICreate_PillButton( "contents settings", 0, DISPLAY.GetGuiHeight()-203 )
with ( _inst )
{
	SetSound(sfx_ui_click);
	SetDelay(12)
	SetScript( Button_Settings )
	SetWidthFixed( 420, 0 );
	ScreenAlign(fa_left,40,30);
	SetBlend(c_white,c_black);
	Apply();
}
array_push(array,_inst);

if ( os_type == os_macosx or os_type == os_windows )
{
	var _inst = UICreate_PillButton( "contents quit", 0, DISPLAY.GetGuiHeight()-203 )
	with ( _inst )
	{
		SetSound(sfx_ui_click_back);
		SetDelay(14)
		SetScript( Button_QuitApp )
		SetWidthFixed( 420, 0 );
		ScreenAlign(fa_left,40,30);
		SetBlend(c_white,COL_TEMP_MENU_RED);
		Apply();
	}
	array_push(array,_inst);
}

var _h = 0, _len = array_length(array);
for ( var i = 0; i < _len; i++ )
{
	_h += array[i].boxH;
}
_h += (_len-1) * _spacing;

var _yy = (DISPLAY.GetGuiHeight()/2) - (_h/2) + (array[0].boxH/2);
for ( var i = 0; i < _len; i++ )
{
	if ( i > 0 ) _yy += array[i].boxH + _spacing;
	array[i].y = _yy;
	array[i].Apply();
}
