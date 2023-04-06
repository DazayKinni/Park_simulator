PostProcPushShader(undefined, undefined, undefined,                  //Vignette
                   undefined, undefined, undefined,                  //Recolour
                   undefined, undefined,                             //x/y offset
                   undefined, undefined,                             //Flash
                   undefined, undefined, undefined,                  //Chromatic Aberration
                   DistortionGetSurface(), DistortionGetStrength()); //Distortion
DISPLAY.DrawApplicationSurface(false);
shader_pop();


//Kawase blur test
if (false)
{
    kawase_set_size(kawaseBundle, surface_get_width(application_surface)/4, surface_get_height( application_surface)/4);
    kawase_copy_surface(kawaseBundle, application_surface);
    kawase_blur(kawaseBundle);
    
    //draw_surface_stretched(kawase_get_surface(kawaseBundle), 0, 0, DISPLAY.GetGuiWidth(), DISPLAY.GetGuiHeight());
    kawase_draw_dof(kawaseBundle, DISPLAY.GetGuiWidth(), DISPLAY.GetGuiHeight());
}


//Test code for margins
//draw_set_colour(c_red);
//draw_rectangle(0, 0, DISPLAY.GetMarginLeft(), DISPLAY.GetGuiHeight(), false); //Left
//draw_set_colour(c_lime);
//draw_rectangle(DISPLAY.GetMarginLeft(), 0, DISPLAY.GetGuiWidth(), DISPLAY.GetMarginTop(), false); //Top
//draw_set_colour(c_blue);
//draw_rectangle(DISPLAY.GetMarginRight(), 0, DISPLAY.GetGuiWidth(), DISPLAY.GetGuiHeight(), false); //Left
//draw_set_colour(c_yellow);
//draw_rectangle(DISPLAY.GetMarginLeft(), DISPLAY.GetMarginBottom(), DISPLAY.GetMarginRight(), DISPLAY.GetGuiHeight(), false); //Bottom
//draw_set_colour(c_white);