/// @param kawaseBundle
/// @param width
/// @param height

function kawase_set_size(_kawase, _width, _height)
{
    if ((_width != kawase_get_width(_kawase)) || (_height != kawase_get_height(_kawase)))
    {
        var _iterations = array_length(_kawase)-1;
        kawase_destroy(_kawase);
        kawase_create(_width, _height, _iterations, _kawase);
    }
    
    return _kawase;
}