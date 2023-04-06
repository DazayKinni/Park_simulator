event_inherited();

SetDepth();

enum VILLAGER { IDLE, INSTRUCT, MOVE }
myState = VILLAGER.IDLE;

#macro CONTINUE if Game_GetPaused() exit;

xTo = x;
yTo = y;
xFrom = x;
yFrom = y;

mySpd = 2;
curSpd = 0;
xSpd = 0;
ySpd = 0;
xPrev = x;
yPrev = y;
direction = 0;

//pathfinding
canMove = false;
path = 0;

//resource collection
myResource = noone;

//ui
tileHighlightAlpha = 0;
timeMoveStarted = current_time;
selectionRotation = irandom(360);

sprite = {
	idle	: [ spr_villager_idle	/*spr_player_arm_idle,	spr_hair_curly_idle*/ ],
	run		: [ spr_villager_run	/*spr_player_arm_run,		spr_hair_curly_run*/ ],
	walk	: [ spr_villager_walk ],
	chop	: [ spr_villager_chop ],
	mine	: [ spr_villager_mining ],
	doing	: [ spr_villager_doing ],
	jump	: [ spr_villager_jump ],
	
	img : 0,
	imgSpd : sprite_get_speed(spr_villager_idle)/60,
	imgMax : sprite_get_number(spr_villager_idle)-1,
}
setSprite = function( _sprite_array )
{
	if ( spriteArray != _sprite_array )
	{
		spriteArray = _sprite_array;
	
		img = 0;
		imgSpd = sprite_get_speed( spriteArray[0] )/60;
		imgMax = sprite_get_number( spriteArray[0] )-1;
	}
}
spriteArray = sprite.idle;

sfx = {
	tick : 0,
	timer : 20,
	array : [ sfx_footstep_gravel_0, sfx_footstep_gravel_1, sfx_footstep_gravel_2, sfx_footstep_gravel_3 ],
}

event_user(0);	//set up methods