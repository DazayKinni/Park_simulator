function DrawBroxcorpSplash()
{
	if ((room == rm_init) || (room == rm_load))
	{
        with(obj_app)
        {
            var _displayWidth  = display_get_gui_width();
            var _displayHeight = display_get_gui_height();
            
            draw_sprite_stretched_ext(spr_logos_pixel, 0,
                                      0, 0, _displayWidth, _displayHeight,
                                      C_BROXCORP_RED, splashBackgroundAlpha);
            
            draw_sprite_ext(spr_logos_broxcorp, 0,
                            _displayWidth/2, _displayHeight/2,
                            3, 3, 0,
                            c_white, splashLogoAlpha);
        }
	}
}