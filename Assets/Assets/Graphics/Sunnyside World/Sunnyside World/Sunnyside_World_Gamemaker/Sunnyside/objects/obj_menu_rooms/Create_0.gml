var _close = UICreate_SpriteButton( NAV_ARROW_X, NAV_TOP_Y, spr_icon_close_floating );
with _close
{
	SetSound(sfx_ui_click_back);
	SetScript(Menu_PageBack)
	SetDelay(2);
}

var _header = UICreate_Header( DISPLAY.GetGuiMidX(), NAV_TOP_Y, "select room" );
with _header
{
	SetDelay(4);	
}

var _yy = 420;
/*var _inst = UICreate_PillButton( "roomName playground", DISPLAY.GetGuiMidX(), _yy )
with ( _inst )
{
	SetSound(sfx_ui_click_confirm);
	SetDelay(20)
	SetRoomGoto(rm_game_playground);
	SetWidthFixed( 600, 0 )
	//ScreenAlign(fa_left,40,30);
	SetBlend(c_white,c_black);
	Apply();
}*/

//_yy += 110;
var _inst = UICreate_PillButton( "roomName game", DISPLAY.GetGuiMidX(), _yy )
with ( _inst )
{
	SetSound(sfx_ui_click_confirm);
	SetDelay(22)
	SetRoomGoto(rm_game);
	SetWidthFixed( 600, 0 );
	//ScreenAlign(fa_left,40,30);
	SetBlend(c_white,c_black);
	Apply();
}