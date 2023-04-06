xFrom = 0;
xTo	  = 410;
xPos  = 0;

xCoordsL = [ -410, 0, -205, -615 ];
xCoordsR = [ 205, 615, 410, 0 ];

left = 0;
right = DISPLAY.GetGuiWidth();

timer		= 0;
timerMax	= 16;

alpha = 0;

show = false;

updateCoords = function()
{
	if ( show )
	{
		if ( timer < timerMax )
		{
			timer++;
			var _t = timer/timerMax;
			xPos = BezierCache( xFrom, xTo, _t, .42, 0, .75, 1 );
		}
	}
	else
	{
		timer = 0;	
	}
}
