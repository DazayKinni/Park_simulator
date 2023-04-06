//loop through the current sprite array and draw it
draw_sprite(spr_deco_charactershadow,0,x,y);

if ( selected ) 
{
	var _col = canMove ? c_white : C_BROXCORP_RED;
	DrawGridHighlight(0,0,_col);
}

for ( var i = 0; i < array_length(spriteArray); i++ )
{
	draw_sprite_ext( spriteArray[i], sprite.img, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha );	
}