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
    vec4 texel = texture(DiffuseSampler, texCoord);
    vec2 transformedCoord = mod(((texCoord * OutSize) * 0.125), 1);
    vec4 noise = texture(PatternSampler, transformedCoord);

    float avgColor = (texel.r + texel.g + texel.b) * 0.3333;
    float loweredContrast = (avgColor - 0.5) * 0.2 + 0.5;
    float col = loweredContrast + noise.r * 0.082;
    float threshold = col > 0.5 ? 1.0 : 0.0;

    fragColor = vec4(vec3(threshold), 1.0);
}
