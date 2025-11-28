#version 330

uniform sampler2D DiffuseSampler;
uniform sampler2D PatternSampler;

in vec2 texCoord;

layout(std140) uniform SamplerInfo {
	vec2 OutSize;
	vec2 InSize;
};

out vec4 fragColor;

void main() {
    vec2 transformedCoord = mod(((texCoord * OutSize) * 0.125), 1);
    vec4 noise = texture(PatternSampler, transformedCoord);

    vec4 col = texture(DiffuseSampler, texCoord) + noise * vec4(1.0/12.0, 1.0/12.0, 1.0/6.0, 1.0);
    float r = float(int(col.r*8.0))/8.0;
    float g = float(int(col.g*8.0))/8.0;
    float b = float(int(col.b*4.0))/4.0;

    fragColor = vec4(r, g, b, 1.0);
}
