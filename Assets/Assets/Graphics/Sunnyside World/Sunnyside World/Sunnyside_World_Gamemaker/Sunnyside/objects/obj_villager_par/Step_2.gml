CONTINUE

///run this logic the same step a villager is selected by the cursor
if ( onSelect )
{
	if ( path_exists(path) ) path_delete(path);
	path = path_add();
	selected = true;
	onSelect = false;	
}

//track how fast we're moving
if ( myState == VILLAGER.MOVE )
{
	xSpd = x - xPrev;
	ySpd = y - yPrev;

	if ( xSpd != 0 ) image_xscale = sign(xSpd);
	
	xPrev = x;
	yPrev = y;
}
else
{
	xSpd = 0;
	ySpd = 0;
}