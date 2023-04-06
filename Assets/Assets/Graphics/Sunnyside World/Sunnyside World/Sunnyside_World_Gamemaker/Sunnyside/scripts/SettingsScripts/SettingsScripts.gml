function Settings_IncrementSfx()
{
	if (parent == undefined) exit;		//ignore script
	
	var _amp = parent.fillFactor;
	Trace("sfx amp = ", _amp);
    VinylGainSet("sfx", _amp);
	VaultWrite(SAVEDATA_AUDIO_SFX, _amp);
	
	VinylPlay((image_xscale > 0) ? sfx_ui_click : sfx_ui_click_back);
}

function Settings_IncrementMusic()
{
	if ( parent == undefined ) exit;
	
	var _amp = parent.fillFactor;
	Trace("music amp = ", _amp);
	VinylGainSet("music", _amp);
	VaultWrite(SAVEDATA_AUDIO_MUSIC, _amp);
	
	VinylPlay((image_xscale > 0)? sfx_ui_click : sfx_ui_click_back);
}

function Settings_Haptics()
{
	VaultWrite(SAVEDATA_INPUTS_HAPTICS, toggleState);
	VinylPlay(sfx_ui_click_toggle);
}