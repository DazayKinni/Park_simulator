//<variants>
#define INCLUDE_VIGNETTE             true //  1
#define INCLUDE_TINT                 true //  2
#define INCLUDE_LIGHTNING            true //  4
#define INCLUDE_CHROMATIC_ABERRATION true //  8
#define INCLUDE_DISTORTION           true // 16
//</variants>



varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vPos;



uniform vec2 u_vDrawSize;
uniform vec2 u_vOffset;

#ifdef INCLUDE_VIGNETTE
    uniform float u_fVignetteStrength;
    uniform float u_fVignetteSize;
    uniform vec3  u_vVignetteColour;
#endif

#ifdef INCLUDE_LIGHTNING
    uniform vec4  u_vTint;
    uniform float u_fTintExposure;
#endif

#ifdef INCLUDE_LIGHTNING
    uniform float u_fWhiteFlashParam;
    uniform float u_fWhiteFlashStrength;
#endif

#ifdef INCLUDE_CHROMATIC_ABERRATION
    uniform vec2 u_vRedOffset;
    uniform vec2 u_vGreenOffset;
    uniform vec2 u_vBlueOffset;
#endif

#ifdef INCLUDE_DISTORTION
    uniform sampler2D u_sDistortion;
    uniform vec2      u_fDistortionTexelSize;
#endif



void main()
{
    #ifdef INCLUDE_DISTORTION
        vec3 shockwaveSample = texture2D(u_sDistortion, v_vTexcoord).rgb;
        vec2 coord = v_vTexcoord - u_vOffset + shockwaveSample.b*(2.0*shockwaveSample.rg - 1.0)*u_fDistortionTexelSize;
    #else
        vec2 coord = v_vTexcoord - u_vOffset;
    #endif
    
    #ifdef INCLUDE_CHROMATIC_ABERRATION
        gl_FragColor = vec4(texture2D(gm_BaseTexture, coord + u_vRedOffset  ).r,
                            texture2D(gm_BaseTexture, coord + u_vGreenOffset).g,
                            texture2D(gm_BaseTexture, coord + u_vBlueOffset ).b,
                            1.0);
    #else
        gl_FragColor = vec4(texture2D(gm_BaseTexture, coord));
    #endif
    
    #ifdef INCLUDE_TINT
        gl_FragColor.rgb = u_fTintExposure + mix(gl_FragColor.rgb, u_vTint.rgb*vec3(dot(gl_FragColor.rgb, vec3(0.299, 0.587, 0.114))), u_vTint.a);
    #endif
    
    #ifdef INCLUDE_LIGHTNING
        float luminance = dot(gl_FragColor, vec4(0.299, 0.587, 0.114, 0.0)); //Not super precise but good enough
        luminance = mix(luminance + 0.1, //Make the baseline a bit brighter
                        min(1.0, luminance/0.25 + 0.55), //Crush the greys
                        u_fWhiteFlashParam*u_fWhiteFlashParam*u_fWhiteFlashParam); //Reduce grey crushing quickly over time so we get more of the desaturation effect at the end of the effect
        
        gl_FragColor.rgb = mix(gl_FragColor.rgb, vec3(luminance), u_fWhiteFlashStrength*u_fWhiteFlashParam);
    #endif
    
    #ifdef INCLUDE_VIGNETTE
        float distanceToEdge = distance(v_vPos, clamp(v_vPos, vec2(u_fVignetteSize), u_vDrawSize - u_fVignetteSize)) / u_fVignetteSize;
        gl_FragColor.rgb = mix(gl_FragColor.rgb, u_vVignetteColour, distanceToEdge*u_fVignetteStrength);
    #endif
    
    gl_FragColor *= v_vColour;
}
