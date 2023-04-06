/// @param x
/// @param y
/// @param value

#macro DRAW_TEXT_DEBUG_FONT  fnt_dev

function DrawTextDebug()
{
    var _x = argument[0];
    var _y = argument[1];
    
	var _string = "";
    
	var _i = 2;
	repeat(argument_count-2)
	{
	    _string += string(argument[_i]);
	    ++_i;
	}
    
    var _oldColour = draw_get_colour();
    var _oldAlpha  = draw_get_alpha();
    var _oldFont   = draw_get_font();
    var _oldHAlign = draw_get_halign();
    var _oldVAlign = draw_get_valign();
    
    draw_set_font(DRAW_TEXT_DEBUG_FONT);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_colour(c_black);
    draw_set_alpha(0.5);
    draw_text(_x, _y+2, _string);
    draw_set_alpha(1);
    draw_text(_x-1, _y, _string);
    draw_text(_x, _y-1, _string);
    draw_text(_x+1, _y, _string);
    draw_text(_x, _y+1, _string);
    draw_set_colour(c_white);
    draw_text(_x, _y, _string);
    
    draw_set_colour(_oldColour);
    draw_set_alpha(_oldAlpha);
    draw_set_font(_oldFont);
    draw_set_halign(_oldHAlign);
    draw_set_valign(_oldVAlign);
}