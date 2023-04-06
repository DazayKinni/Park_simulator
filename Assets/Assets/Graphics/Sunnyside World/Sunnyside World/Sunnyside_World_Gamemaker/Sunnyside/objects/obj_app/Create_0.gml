enum APP_STATE {
    UNKNOWN = -1,
    NOT_SET = 0,
    FADE_IN_DWELL,
    FADE_IN_LOGO,
    SET_UP_DYNAMO,
    LOAD_LOCALISATION,
    LOAD_SAVEDATA,
    LOAD,
    CHECK,
    FADE_OUT_DWELL,
    FADE_OUT_LOGO,
    READY,
    MENU,
    GAME,
}

splashBackgroundAlpha = 0;
splashLogoAlpha = 0;

cursor = noone;
#macro CURSOR (obj_app.cursor)

state = APP_STATE.NOT_SET;
stateStartTime = current_time;
AppStateSet(1); //Start with whatever the first state is

SavedataResetAll();

instance_create_depth(0, 0, 0, obj_fileio);
instance_create_depth(0, 0, 0, obj_texan );

//create debug controller
if ( DEBUG_MODE )
{
	instance_create_depth(0,0,0, obj_ui_button_debug);
	global.debugState = false;
	Trace("DEBUG BUTTON CREATED");
}

setAudioLevels = function()
{
	VinylGainSet("music", VaultRead(SAVEDATA_AUDIO_MUSIC, 0.8));	
	VinylGainSet("sfx",   VaultRead(SAVEDATA_AUDIO_SFX,   0.9));	
}