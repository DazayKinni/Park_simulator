function Game_GetPaused()
{
	if !GAME_SESSION return true
	return global.gamePaused;
}

function Game_SetPaused(_state)
{
	global.gamePaused = _state;	
}

function Approach(_from,_to,_change)
{
	if (_from < _to)  return min(_from + _change, _to); 
	return max(_from - _change, _to);	
}

enum CURRENCY { WOOD, ROCK, BERRY }
function CurrencyAdd(_type,_amt)
{
	switch ( _type )
	{
		case CURRENCY.WOOD :
			global.currency.wood += _amt;
		break;
		
		case CURRENCY.ROCK :
			global.currency.rocks += _amt;
		break;
		
		case CURRENCY.BERRY :
			global.currency.berries += _amt;
		break;
	}
}