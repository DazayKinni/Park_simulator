function AppStateGetName(_state)
{
    switch(_state)
    {
        case APP_STATE.UNKNOWN:           return "APP_STATE.UNKNOWN";
        case APP_STATE.NOT_SET:           return "APP_STATE.NOT_SET";
        case APP_STATE.FADE_IN_DWELL:     return "APP_STATE.FADE_IN_DWELL";
        case APP_STATE.FADE_IN_LOGO:      return "APP_STATE.FADE_IN_LOGO";
        case APP_STATE.SET_UP_DYNAMO:     return "APP_STATE.SET_UP_DYNAMO";
        case APP_STATE.LOAD_LOCALISATION: return "APP_STATE.LOAD_LOCALISATION";
        case APP_STATE.LOAD_SAVEDATA:     return "APP_STATE.LOAD_SAVEDATA";
        case APP_STATE.LOAD:              return "APP_STATE.LOAD";
        case APP_STATE.CHECK:             return "APP_STATE.CHECK";
        case APP_STATE.FADE_OUT_DWELL:    return "APP_STATE.FADE_OUT_DWELL";
        case APP_STATE.FADE_OUT_LOGO:     return "APP_STATE.FADE_OUT_LOGO";
        case APP_STATE.READY:             return "APP_STATE.READY";
        case APP_STATE.MENU:              return "APP_STATE.MENU";
        case APP_STATE.GAME:              return "APP_STATE.GAME";
        
        default:
            TraceError("App state ", _state, " unhandled");
        break;
    }
}