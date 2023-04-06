/// @param x
/// @param y
/// @param width
/// @param height
/// @param colour
/// @param alpha
/// @param fillLeft
/// @param fillRight
/// @param [centre=false]

function draw_pill_part(_x, _y, _width, _height, _colour, _alpha, _fillLeft, _fillRight, _centre = false)
{
    static _sprite     = spr_pill;
    static _baseSize   = sprite_get_width(_sprite);
    static _middleSize = 4;
    static _edgeSize   = (_baseSize - _middleSize)/2;
    
    if (_width <= 0) return;
    
    var _scale = _height/_baseSize;
    
    if (_centre)
    {
        _x -= _width/2;
        _y -= _height/2;
    }
    
    var _partL = max(0, _fillLeft/_scale);
    var _partR = min(_edgeSize, _fillRight/_scale);
    if (_partR > _partL)
    {
        draw_sprite_part_ext(_sprite, 0, _partL, 0, _partR - _partL, _baseSize, _x + _partL*_scale, _y, _scale, _scale, _colour, _alpha);
    }
    
    var _partL = max(_scale*_edgeSize, _fillLeft);
    var _partR = min(_width - _scale*_edgeSize, _fillRight);
    if (_partR > _partL)
    {
        draw_sprite_part_ext(_sprite, 0, _edgeSize+1, 0, _middleSize, _baseSize, _x + _partL, _y, (_partR - _partL)/_middleSize, _scale, _colour, _alpha);
    }
    
    var _xL = _partR;
    var _partL = _edgeSize + _middleSize + max(0, _fillLeft - (_width - _scale*_edgeSize))/_scale;
    var _partR = _edgeSize + _middleSize + min(_edgeSize, (_fillRight - (_width - _scale*_edgeSize))/_scale);
    
    if (_partR > _partL)
    {
        draw_sprite_part_ext(_sprite, 0, _partL, 0, _partR - _partL, _baseSize, _x + _xL, _y, _scale, _scale, _colour, _alpha);
    }
}
