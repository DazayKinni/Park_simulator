if ( timer < timerMax ) 
{
	timer++;
	image_xscale = BezierCache( scaleFrom, scaleTo, timer/timerMax, 0, 0, .5, 1 );
	image_yscale = image_xscale;
}