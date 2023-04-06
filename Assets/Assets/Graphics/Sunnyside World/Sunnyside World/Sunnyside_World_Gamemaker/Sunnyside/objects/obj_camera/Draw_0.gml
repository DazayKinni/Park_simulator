///@desc draw debug

if DEBUG_MODE
{
	draw_set_color(c_blue);
	draw_rectangle( dragX1, dragY1, dragX2, dragY2, true );	
	draw_set_color(c_white);
}