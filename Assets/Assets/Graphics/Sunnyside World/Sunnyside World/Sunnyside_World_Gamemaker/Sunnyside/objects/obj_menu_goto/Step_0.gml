if ( timer < timerMax )
{
	timer++;
	curWidth = BezierCache( minWidth, width, timer/timerMax, .25, 0, 1, 1 );
	startTime = current_time;
}
else
{
	if ( fadeout ) 
	{
		if ( MUSIC_TITLES != undefined ) VinylFadeOut( global.audio_TitleMusic, 1 );
		fadeout = false;	
	}
	
	if ( current_time >= startTime + 50 )	
	{
		room_goto(global.nextRoom);	
	}
}