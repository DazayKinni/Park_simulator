/// @param x
/// @param y
/// @param minRadius
/// @param maxRadius
/// @param exponent
/// @param [alpha=1]

function DistortionDrawShockwave(_x, _y, _minRadius, _maxRadius, _exponent, _alpha = 1)
{
    static _u_vCentre    = shader_get_uniform(shdDistortionShockwave, "u_vCentre"   );
    static _u_fMinRadius = shader_get_uniform(shdDistortionShockwave, "u_fMinRadius");
    static _u_fMaxRadius = shader_get_uniform(shdDistortionShockwave, "u_fMaxRadius");
    static _u_fExponent  = shader_get_uniform(shdDistortionShockwave, "u_fExponent" );
    
    shader_push(shdDistortionShockwave);
    
    draw_set_alpha(_alpha);
    shader_set_uniform_f(_u_vCentre,    _x, _y);
    shader_set_uniform_f(_u_fMinRadius, _minRadius);
    shader_set_uniform_f(_u_fMaxRadius, _maxRadius);
    shader_set_uniform_f(_u_fExponent,  _exponent);
    draw_rectangle(_x - _maxRadius, _y - _maxRadius,
                   _x + _maxRadius, _y + _maxRadius, false);
    draw_set_alpha(1);
    
    shader_pop();
}