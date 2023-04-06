__DistortionInit();

function __DistortionInit()
{
    static _initialized = false;
    if (_initialized) return;
    _initialized = true;
    
    global.__distortionHandler = {
        __enabled:  false,
        __surface:  -1,
        __strength: 120,
        __function: undefined,
    }
    
    
    time_source_start(time_source_create(time_source_global, time_source_units_frames, 1, function()
    {
        if (DistortionSurfaceSetTarget())
        {
            var _filter = gpu_get_tex_filter();
            gpu_set_tex_filter(true);
            draw_clear(make_colour_rgb(127, 127, 0));
            
            //Don't mess with the alpha channel
            gpu_set_colorwriteenable(true, true, true, false);
            
            var _function = global.__distortionHandler.__function;
            if (is_method(_function)) _function();
            
            gpu_set_colorwriteenable(true, true, true, true);
            gpu_set_tex_filter(_filter);
            surface_reset_target();
        }
    }, [], -1));
}
    
////Storm first because it was made with 100% alpha and would wipe out shockwaves if drawn last
//if (obj_room.stormDistortion)
//{
//    var _scale = max(_width / sprite_get_width(spr_distortion_wave_test), _height / sprite_get_height(spr_distortion_wave_test));
//    var _y = distortionStormY mod (_scale*sprite_get_height(spr_distortion_wave_test));
//    var _blend = make_colour_rgb(255, 255, 255*distortionTextureStrength/distortionStrength);
//    
//    draw_sprite_ext(spr_distortion_wave_test, 0, 0, _y - _scale*sprite_get_height(spr_distortion_wave_test), _scale, _scale, 0, _blend, 1);
//    draw_sprite_ext(spr_distortion_wave_test, 0, 0, _y, _scale, _scale, 0, _blend, 1);
//}
//
////Then the shockwaves since they *do* have an alpha blend
//if (instance_exists(obj_nuke_shockwave))
//{
//    //Figure out the transform for worldspace to screenspace
//    var _camera  = view_camera[0];
//    var _xOffset = -camera_get_view_x(_camera);
//    var _yOffset = -camera_get_view_y(_camera);
//    var _xScale  = surface_get_width( application_surface) / camera_get_view_width( _camera);
//    var _yScale  = surface_get_height(application_surface) / camera_get_view_height(_camera);
//    
//    //Iterate over every shockwave and draw them using this special ring shader
//    shader_set(sh_nuke_shockwave);
//    
//    with(obj_nuke_shockwave)
//    {
//        draw_set_alpha(alpha);
//        shader_set_uniform_f(shader_get_uniform(shader_current(), "u_vCentre"   ), _xScale*(x + _xOffset), _yScale*(y + _yOffset));
//        shader_set_uniform_f(shader_get_uniform(shader_current(), "u_fMaxRadius"), _xScale*max_radius);
//        shader_set_uniform_f(shader_get_uniform(shader_current(), "u_fMinRadius"), _yScale*min_radius);
//        shader_set_uniform_f(shader_get_uniform(shader_current(), "u_fExponent" ), exponent);
//        draw_rectangle(_xScale*(x + _xOffset - max_radius), _yScale*(y + _yOffset - max_radius),
//                       _xScale*(x + _xOffset + max_radius), _yScale*(y + _yOffset + max_radius), false);
//    }
//    
//    draw_set_alpha(1);
//    shader_reset();
//}