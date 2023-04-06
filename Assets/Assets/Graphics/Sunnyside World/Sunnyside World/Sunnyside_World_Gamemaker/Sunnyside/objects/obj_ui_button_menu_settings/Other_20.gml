// Inherit the parent event
toggleState = !toggleState;
event_inherited();
switch ( myState )
{
	case SETTINGSBUTTON.TOGGLE :
		Trace( "Settings button ", locKey, " set to ", toggleState ? "true" : "false" );
	break;
}

