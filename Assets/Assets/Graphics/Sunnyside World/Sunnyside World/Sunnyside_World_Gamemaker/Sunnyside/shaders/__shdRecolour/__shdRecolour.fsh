varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_fBlend;

void main()
{
    gl_FragColor = texture2D(gm_BaseTexture, v_vTexcoord);
    gl_FragColor.rgb = mix(gl_FragColor.rgb, v_vColour.rgb*vec3(dot(gl_FragColor.rgb, vec3(0.299, 0.587, 0.114))), u_fBlend);
    gl_FragColor.a *= v_vColour.a;
}
