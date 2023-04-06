CONTINUE

if ( current_time >= time + timer )
{
	if ( alpha > 0 ) alpha -= 0.05;
	else instance_destroy();
}