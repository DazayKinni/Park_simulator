varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 u_vFlash;

void main()
{
    gl_FragColor = v_vColour*texture2D( gm_BaseTexture, v_vTexcoord);
    gl_FragColor.rgb = mix(gl_FragColor.rgb, u_vFlash.rgb, u_vFlash.a);
}
