/// @param x
/// @param y
/// @param width
/// @param height
/// @param colour
/// @param alpha
/// @param [centre=false]
/// @param [shadow=false]

function draw_pill(_x, _y, _width, _height, _colour, _alpha, _centre = false, _shadow = false)
{
    static _shadowOffset = 4;
    static _shadowAlpha  = 0.25;
    static _sprite       = spr_pill;
    static _baseSize     = sprite_get_width(_sprite);
    static _middleSize   = 4;
    static _edgeSize     = (_baseSize - _middleSize)/2;
    
    if (_width <= 0) return;
    if (_shadow) draw_pill(_x - _shadowOffset, _y + _shadowOffset, _width, _height, c_black, _shadowAlpha, _centre, false)
    
    var _scale       = _height/_baseSize;
    var _middleWidth = _width - (_baseSize-_middleSize)*_scale;
    
    if (_centre)
    {
        _x -= _width/2;
        _y -= _height/2;
    }
    
    draw_sprite_part_ext(_sprite, 0,             0, 0,   _edgeSize, _baseSize, _x,                                   _y, _scale,                   _scale, _colour, _alpha);
    draw_sprite_part_ext(_sprite, 0,   _edgeSize+1, 0, _middleSize, _baseSize, _x + _scale*_edgeSize,                _y, _middleWidth/_middleSize, _scale, _colour, _alpha);
    draw_sprite_part_ext(_sprite, 0, 116-_edgeSize, 0,   _edgeSize, _baseSize, _x + _scale*_edgeSize + _middleWidth, _y, _scale,                   _scale, _colour, _alpha);
}