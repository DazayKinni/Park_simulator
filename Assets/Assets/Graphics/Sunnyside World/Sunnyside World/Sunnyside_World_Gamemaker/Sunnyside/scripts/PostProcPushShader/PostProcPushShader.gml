/// @param [vignetteStrength=0]
/// @param [vignetteSize=0]
/// @param [vignetteColour=c_white]
/// @param [tintColour=c_white]
/// @param [tintBlend=0]
/// @param [tintExposure=0]
/// @param [xOffset=0]
/// @param [yOffset=0]
/// @param [flashParam=0]
/// @param [flashStrength=0]
/// @param [chromaWidth=0]
/// @param [chromaHeight=0]
/// @param [chromaSplit=0]
/// @param [distortionSurface]
/// @param [distortionStrength=0]

function PostProcPushShader(_vignetteStrength = 0, _vignetteSize = 0, _vignetteColour = c_white, _tintColour = c_white, _tintBlend = 0, _tintExposure = 0, _xOffset = 0, _yOffset = 0, _flashParam = 0, _flashStrength = 0, _shakeWidth = 0, _shakeHeight = 0, _chromaticSplitSize = 0, _distortionSurface = undefined, _distortionStrength = 0)
{
    static _u_vDrawSize            = shader_get_uniform(shdPostProcessing,       "u_vDrawSize"           );
    static _u_fVignetteStrength    = shader_get_uniform(shdPostProcessing,       "u_fVignetteStrength"   );
    static _u_fVignetteSize        = shader_get_uniform(shdPostProcessing,       "u_fVignetteSize"       );
    static _u_vVignetteColour      = shader_get_uniform(shdPostProcessing,       "u_vVignetteColour"     );
    static _u_vTint                = shader_get_uniform(shdPostProcessing,       "u_vTint"               );
    static _u_fTintExposure        = shader_get_uniform(shdPostProcessing,       "u_fTintExposure"       );
    static _u_vOffset              = shader_get_uniform(shdPostProcessing,       "u_vOffset"             );
    static _u_fWhiteFlashParam     = shader_get_uniform(shdPostProcessing,       "u_fWhiteFlashParam"    );
    static _u_fWhiteFlashStrength  = shader_get_uniform(shdPostProcessing,       "u_fWhiteFlashStrength" );
    static _u_vRedOffset           = shader_get_uniform(shdPostProcessing,       "u_vRedOffset"          );
    static _u_vGreenOffset         = shader_get_uniform(shdPostProcessing,       "u_vGreenOffset"        );
    static _u_vBlueOffset          = shader_get_uniform(shdPostProcessing,       "u_vBlueOffset"         );
    static _u_sDistortion          = shader_get_sampler_index(shdPostProcessing, "u_sDistortion"         );
    static _u_fDistortionTexelSize = shader_get_uniform(shdPostProcessing,       "u_fDistortionTexelSize");
    
    var _appTexture = surface_get_texture(application_surface);
    var _appTexelW  = texture_get_texel_width( _appTexture);
    var _appTexelH  = texture_get_texel_height(_appTexture);
    
    shader_push(shdPostProcessing);
    
    shader_set_uniform_f(_u_vDrawSize, surface_get_width(application_surface), surface_get_height(application_surface));
    shader_set_uniform_f(_u_vOffset,   _xOffset, _yOffset);
    
    shader_set_uniform_f(_u_fVignetteStrength, _vignetteStrength);
    shader_set_uniform_f(_u_fVignetteSize,     max(math_get_epsilon(), _vignetteSize)); //Prevents a div-by-zero in the shader
    shader_set_uniform_f(_u_vVignetteColour,   colour_get_red(_vignetteColour)/255, colour_get_blue(_vignetteColour)/255, colour_get_green(_vignetteColour)/255);
    
    shader_set_uniform_f(_u_vTint, colour_get_red(_tintColour)/255, colour_get_blue(_tintColour)/255, colour_get_green(_tintColour)/255, _tintBlend);
    shader_set_uniform_f(_u_fTintExposure, _tintExposure/255);
    
    shader_set_uniform_f(_u_fWhiteFlashParam,    _flashParam);
    shader_set_uniform_f(_u_fWhiteFlashStrength, _flashStrength);
    
    var _shakeX  = _appTexelW*_shakeWidth;
    var _shakeY  = _appTexelH*_shakeHeight;
    var _chromaX = _appTexelW*_chromaticSplitSize;
    shader_set_uniform_f(_u_vRedOffset,    _chromaX + random_range(-_shakeX, _shakeX), random_range(-_shakeY, _shakeY));
    shader_set_uniform_f(_u_vGreenOffset, -_chromaX + random_range(-_shakeX, _shakeX), random_range(-_shakeY, _shakeY));
    shader_set_uniform_f(_u_vBlueOffset,  -_chromaX + random_range(-_shakeX, _shakeX), random_range(-_shakeY, _shakeY));
    
    if ((_distortionSurface != undefined) && surface_exists(_distortionSurface))
    {
        var _texture = surface_get_texture(_distortionSurface);
        var _texelW  = texture_get_texel_width( _texture);
        var _texelH  = texture_get_texel_height(_texture);
        
        texture_set_stage(   _u_sDistortion, _texture);
        shader_set_uniform_f(_u_fDistortionTexelSize, _texelW*_distortionStrength, _texelH*_distortionStrength);
    }
    else
    {
        texture_set_stage(   _u_sDistortion, _appTexture);
        shader_set_uniform_f(_u_fDistortionTexelSize, 0, 0);
    }
}