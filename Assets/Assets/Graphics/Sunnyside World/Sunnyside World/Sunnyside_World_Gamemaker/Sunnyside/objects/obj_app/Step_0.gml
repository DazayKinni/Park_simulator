switch AppStateGet()
{
    case APP_STATE.FADE_IN_DWELL:
        if (!SHOw_SPLASH || (AppStateGetTimeElapsed() > 300)) AppStateSet(APP_STATE.FADE_IN_LOGO);
    break;
    
    case APP_STATE.FADE_IN_LOGO:
        splashBackgroundAlpha = clamp(AppStateGetTimeElapsed() / 1000, 0, 1);
        splashLogoAlpha = clamp(AppStateGetTimeElapsed() / 1000, 0, 1);
        
        if (!SHOw_SPLASH)
        {
            splashBackgroundAlpha = 1;
            splashLogoAlpha       = 1;
        }
        
        if (splashLogoAlpha >= 1)
        {
            fadeInCompleteTime = current_time;
            AppStateSet(APP_STATE.SET_UP_DYNAMO);
        }
    break;
    
	case APP_STATE.SET_UP_DYNAMO:
        DynamoFile("english.csv", "buffer", function(_buffer)
        {
            if (DEV_CONFIG) Trace("Change detected in \"english.csv\"");
            LyreLoadSourceFromBuffer(_buffer);
        });
        
        AppStateSet(APP_STATE.LOAD_LOCALISATION);
	break
    
	case APP_STATE.LOAD_LOCALISATION:
        DynamoFileLoad("english.csv");
        AppStateSet(APP_STATE.LOAD_SAVEDATA);
	break
    
	case APP_STATE.LOAD_SAVEDATA:
        SavedataResetAll();
        SavedataLoad(VAULT_DEFAULT);
        AppStateSet(APP_STATE.CHECK);
	break
	
	case APP_STATE.CHECK:
		//Only proceed once we've finished all our file operations
        if (FileIoQueueSize() <= 0) 
		{
			AppStateSet(APP_STATE.FADE_OUT_DWELL);
			setAudioLevels();
		}
	break;
    
    case APP_STATE.FADE_OUT_DWELL:
        if (!SHOw_SPLASH || (current_time - fadeInCompleteTime > 1000)) AppStateSet(APP_STATE.FADE_OUT_LOGO);
    break;
    
    case APP_STATE.FADE_OUT_LOGO:
        splashLogoAlpha = 1 - clamp(AppStateGetTimeElapsed() / 500, 0, 1);
        if (!SHOw_SPLASH || (splashLogoAlpha <= 0)) AppStateSet(APP_STATE.READY);
    break;
	
	case APP_STATE.READY:
        AppStateSet(APP_STATE.MENU);
		room_goto(rm_menu);
		cursor = instance_create_depth(0,0,0,obj_cursor);
	break;
	
	case APP_STATE.MENU:
	break;
	
	case APP_STATE.GAME:
	break;
    
    default:
        TraceError("App state ", AppStateGet(), " unhandled");
    break;
}