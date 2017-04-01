#include <common_frag>

// if no light> this will not active
uniform float u_Specular;
uniform vec4 u_SpecularColor;

uniform vec3 emissive;

#include <uv_pars_frag>
#include <diffuseMap_pars_frag>
#include <normalMap_pars_frag>
#include <light_pars_frag>
#include <normal_pars_frag>
#include <viewModelPos_pars_frag>
#include <RE_Lambert>
#include <RE_Phong>
#include <RE_BlinnPhong>
#include <envMap_pars_frag>
#include <shadowMap_pars_frag>
#include <fog_pars_frag>
#include <emissiveMap_pars_frag>
void main() {
    #include <begin_frag>
    #include <diffuseMap_frag>
    #include <normal_frag>
    #include <light_frag>
    #include <envMap_frag>
    #include <shadowMap_frag>

    vec3 totalEmissiveRadiance = emissive;
    #include <emissiveMap_frag>
    outColor += vec4(totalEmissiveRadiance.rgb, 0.0);

    #include <end_frag>
    #include <premultipliedAlpha_frag>
    #include <fog_frag>
}