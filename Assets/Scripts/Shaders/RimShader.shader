Shader "Custom/RimShader"
{
    Properties
    {
        _RimColor ("RimColor", Color) = (0,0.5,0.5,0)
        _RimPower ("RimPower", Range(-5,5)) = 1
        _StripesWidth ("StripesWidth", Range (0, 10)) =1
    }
    
    SubShader 
    {
      CGPROGRAM
        #pragma surface surf Lambert
         
        struct Input 
        {
            float3 viewDir;
            float3 worldPos;
        };
        
        float4 _RimColor;
        float _RimPower;
        float _StripesWidth;
        
        void surf (Input IN, inout SurfaceOutput o)
        {
            half rim = 1 - saturate(dot(normalize(IN.viewDir), o.Normal));
            o.Emission = frac(IN.worldPos.y * 10) > 0.1 * _StripesWidth ? float3(1,1,1) * rim : float3(0,0,0) * rim || frac(IN.worldPos.x * 10) > 0.1 * _StripesWidth ? float3(1,1,1) * rim : float3(0,0,0) * rim;
        }
      
      ENDCG
    }
    FallBack "Diffuse"
}
