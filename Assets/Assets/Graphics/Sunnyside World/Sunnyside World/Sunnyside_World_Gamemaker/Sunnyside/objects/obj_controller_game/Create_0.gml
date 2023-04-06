
global.player[0] = instance_create_depth( room_width/2, room_height/2, 0, obj_villager_par );
global.player[1] = noone;

CAMERA.x = global.player[0].x;
CAMERA.y = global.player[0].y;

mpGrid = undefined;
dGrid = undefined;

//initialise some kind of stats box for player resources
global.currency = {
	wood	: 0,	
	rocks	: 0,
	berries : 0,
}

Menu_SetPage( MENUPAGE.GAME );