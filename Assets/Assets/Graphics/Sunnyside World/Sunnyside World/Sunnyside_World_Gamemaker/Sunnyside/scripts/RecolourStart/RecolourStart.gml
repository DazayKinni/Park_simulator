/// @param [blendFactor=1]

function RecolourStart(_blend = 1)
{
    static _u_fBlend = shader_get_uniform(__shdRecolour, "u_fBlend");
    
    shader_push(__shdRecolour);
    shader_set_uniform_f(_u_fBlend, clamp(_blend, 0, 1));
}