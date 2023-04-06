/// @desc
Trace( object_get_name(object_index), " button created at ", x, ",", y );

boxW = sprite_width;
boxH = sprite_height;

locKey = undefined;
transform = new MenuTransform();
scriptOnPress = undefined;
parent = undefined;

event_user(MENU_EVENT.METHODS); //set up methods

SetCoords();

mySound = undefined;