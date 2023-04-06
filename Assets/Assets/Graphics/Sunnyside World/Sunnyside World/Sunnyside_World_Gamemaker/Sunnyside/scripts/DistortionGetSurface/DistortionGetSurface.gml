function DistortionGetSurface()
{
    var _surface = global.__distortionHandler.__surface;
    
    if (global.__distortionHandler.__enabled)
    {
        var _width  = surface_get_width( application_surface);
        var _height = surface_get_height(application_surface);
        if (surface_exists(_surface) && ((surface_get_width(_surface) != _width) || (surface_get_width(_surface) != _width)))
        {
            surface_free(_surface);
            _surface = -1;
        }
        
        if (!surface_exists(_surface))
        {
            _surface = surface_create(_width, _height);
            
            surface_set_target(_surface);
            draw_clear(make_colour_rgb(127, 127, 0));
            surface_reset_target();
        }
        
        global.__distortionHandler.__surface = _surface;
        
    }
    else
    {
        if (surface_exists(_surface))
        {
            surface_free(_surface);
            _surface = -1;
        }
    }
    
    return _surface;
}