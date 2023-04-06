varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_fMix;

void main()
{
    gl_FragColor = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
    gl_FragColor.rgb = mix(gl_FragColor.rgb, vec3(1.0), u_fMix);
}
