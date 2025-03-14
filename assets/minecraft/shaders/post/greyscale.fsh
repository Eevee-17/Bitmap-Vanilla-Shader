#version 150

uniform sampler2D InSampler;

in vec2 texCoord;
in vec2 oneTexel;
uniform vec2 InSize;

out vec4 fragColor;

void main() {
	vec4 texel = texture(InSampler, texCoord);
	
	float avg_color = (texel.r + texel.g + texel.b) * 0.3333;
	
	fragColor = vec4(avg_color);
}