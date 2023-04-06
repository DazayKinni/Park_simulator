var _close = UICreate_SpriteButton( NAV_ARROW_X, NAV_TOP_Y, spr_icon_close_floating );
with _close
{
	SetSound(sfx_ui_click_back);
	SetScript(Menu_PageBack)
	SetDelay(2);
}

var _xx = DISPLAY.GetGuiMidX(); 
var _header = UICreate_Header(_xx, NAV_TOP_Y, "contents settings" );
with _header
{
	SetDelay(4);	
}

var _yy = DISPLAY.GetGuiMidY()-166;
var _inst = UICreate_SettingsButton( "settings music", _xx, _yy )
with ( _inst )
{
	SetScript(Settings_IncrementMusic);
	SetDelay(8)
	SetWidthFixed( 420, 0 );
	SetBlend(c_white,c_black);
	Apply();
	
	SetSlider(VaultRead(SAVEDATA_AUDIO_MUSIC, 0.8), 0.05);
}

_yy += 112;
var _inst = UICreate_SettingsButton( "settings sfx", _xx, _yy )
with ( _inst )
{
	SetScript(Settings_IncrementSfx);
	SetDelay(12)
	SetWidthFixed( 420, 0 );
	SetBlend(c_white,c_black);
	Apply();
	
	SetSlider(VaultRead(SAVEDATA_AUDIO_SFX, 0.9), 0.05);
}

if MobileBuild()
{
	_yy += 112;
	var _inst = UICreate_SettingsButton( "settings haptics", _xx, _yy )
	with ( _inst )
	{
		SetDelay(16)
		SetWidthFixed( 420, 0 );
	
		SetState(SETTINGSBUTTON.TOGGLE, Settings_Haptics);
		toggleState = VaultRead(SAVEDATA_INPUTS_HAPTICS, true);
	
		SetBlend(c_white, c_black);
		Apply();
	}
}