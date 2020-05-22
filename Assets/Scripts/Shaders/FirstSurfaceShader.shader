Shader "MyShader/HelloShader" 
{
    Properties 
    {
        _albedoColor ("Albedo", Color) = (1,1,1,1)
        _emissionColor ("Emission", Color) = (1,1,1,1)
        _normalColor ("Normal", Color) = (1,1,1,1)
    }
    
    SubShader 
    {
        CGPROGRAM   
            #pragma surface surf Lambert
            
            struct Input
            {
                float2 uvMainTex;
            };
            
            fixed4 _albedoColor;
            fixed4 _emissionColor;
            fixed4 _normalColor;
            
            void surf (Input IN, inout SurfaceOutput o)
            {
                o.Albedo = _albedoColor.rgba;
                o.Emission = _emissionColor.rgba;
                o.Normal = _normalColor.rgba;
            }
            
        ENDCG
    }
    
    FallBack "Diffuse"
}