function StartMove()
{	
	xFrom = x;
	yFrom = y;
	xTo = path_get_x(path,1);
	yTo = path_get_y(path,1);
	path_start(path,mySpd,0,0);
	myState = VILLAGER.MOVE;
	GridHighlightCreate(xTo,yTo);
}