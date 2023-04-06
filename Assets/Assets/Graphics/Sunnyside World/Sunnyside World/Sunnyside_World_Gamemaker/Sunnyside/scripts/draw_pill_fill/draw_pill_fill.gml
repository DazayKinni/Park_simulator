/// @param x
/// @param y
/// @param width
/// @param height
/// @param colour
/// @param alpha
/// @param fillWidth
/// @param [centre=false]

function draw_pill_fill(_x, _y, _width, _height, _colour, _alpha, _fillWidth, _centre = false)
{
    static _sprite     = spr_pill;
    static _baseSize   = sprite_get_width(_sprite);
    static _middleSize = 4;
    static _edgeSize   = (_baseSize - _middleSize)/2;
    
    if (_width <= 0) return;
    
    var _scale       = _height/_baseSize;
    var _middleWidth = min(_fillWidth - _edgeSize*_scale, _width - (_baseSize-_middleSize)*_scale);
    var _endWidth    = _edgeSize + min(0, _fillWidth - _width);
    
    if (_centre)
    {
        _x -= _width/2;
        _y -= _height/2;
    }
    
    draw_sprite_part_ext(_sprite, 0, 0, 0, min(_edgeSize, _fillWidth), _baseSize, _x, _y, _scale, _scale, _colour, _alpha);
    
    if (_middleWidth > 0)
    {
        draw_sprite_part_ext(_sprite, 0, _edgeSize+1, 0, _middleSize, _baseSize, _x + _scale*_edgeSize, _y, _middleWidth/_middleSize, _scale, _colour, _alpha);
    }
    
    if (_endWidth > 0)
    {
        draw_sprite_part_ext(_sprite, 0, 116-_edgeSize, 0, _endWidth, _baseSize, _x + _scale*_edgeSize + _middleWidth, _y, _scale, _scale, _colour, _alpha);
    }
}