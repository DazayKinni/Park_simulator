varying vec2 v_vTexcoord;
varying vec4 v_vColour;

const int MAX_COLOURS = 4; //Make sure you update PALETTE_SWAP_MAX_COLOURS macro in PaletteSwap()!

uniform vec3  u_aColourIn[MAX_COLOURS];
uniform vec3  u_aColourOut[MAX_COLOURS];
uniform vec3  u_aColourTolerance[MAX_COLOURS];
uniform float u_aBlend[MAX_COLOURS];

vec3 rgb_to_hsv(vec3 c)
{
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));

    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

vec3 hsv_to_rgb(vec3 c)
{
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

void main()
{
    vec4 colourPixel = texture2D(gm_BaseTexture, v_vTexcoord);
    vec3 colourHSV = rgb_to_hsv(colourPixel.rgb);
    vec4 colourResult = colourPixel;
    
    for (int i = 0; i < MAX_COLOURS; i += 1)
    {            
        if (u_aColourIn[i] != vec3(0.0))
        {
            vec3 colourDelta = colourHSV - u_aColourIn[i];
            //Choose the shortest path around the HSV cylinder
            if (abs(colourDelta.r) > 0.5) colourDelta.r -= sign(colourDelta.r);
            
            //If all of the deltas are 
            if (all(lessThanEqual(abs(colourDelta), u_aColourTolerance[i]))) 
            {
                //N.B. We interpolate in RGB space here because it looks better, even though it's more expensive
                colourResult.rgb = mix(hsv_to_rgb(vec3(mod(  u_aColourOut[i].r + colourDelta.r, 1.0),
                                                       clamp(u_aColourOut[i].g + colourDelta.g, 0.0, 1.0),
                                                       clamp(u_aColourOut[i].b + colourDelta.b, 0.0, 1.0))),
                                       hsv_to_rgb(u_aColourOut[i]),
                                       u_aBlend[i]);
            }
        }
    }
    
    gl_FragColor = v_vColour*colourResult;
}