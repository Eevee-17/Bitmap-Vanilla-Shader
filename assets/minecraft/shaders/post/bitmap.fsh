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

    vec3 loweredContrast = mix(texel, 1.0 - texel, 0.4).rgb;

    vec2 transformedCoord = mod(((texCoord * OutSize) * 0.125), 1);
    vec4 noise = texture(PatternSampler, transformedCoord);

    vec3 col = loweredContrast + noise.rgb * vec3(1.0/12.0, 1.0/12.0, 1.0/6.0);
    float r = float(int(col.r*8.0)) * 0.125;
    float g = float(int(col.g*8.0)) * 0.125;
    float b = float(int(col.b*4.0)) * 0.25;

    float avgColor = (r + g + b) * 0.3333;

    float threshold = avgColor > 0.47 ? 1.0 : 0.0;

    fragColor = vec4(vec3(threshold), 1.0);
}
