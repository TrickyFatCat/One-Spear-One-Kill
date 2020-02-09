varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_alpha;

void main() {
	vec4 colour = texture2D(gm_BaseTexture, v_vTexcoord);
	gl_FragColor = vec4(v_vColour.rgb, u_alpha * colour.a);
}