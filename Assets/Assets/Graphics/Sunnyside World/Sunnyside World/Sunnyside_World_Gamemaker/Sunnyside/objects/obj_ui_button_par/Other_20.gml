/// @desc ON PRESS
transform.Repeat();
if ( mySound != undefined ) VinylPlay( mySound );
if ( scriptOnPress == undefined )
{
	Trace( object_get_name(object_index), " pressed at ", Touch_GetPressedGuiX(0), ",", Touch_GetPressedGuiY(0), ". scriptOnPress == undefined" );
}
else
{
	script_execute( scriptOnPress );	
}