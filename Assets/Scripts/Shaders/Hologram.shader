Shader "Custom/Hologram"
{
    Properties
    {
        _RimColor ("RimColor", Color) = (0,0.5,0.5,0)
        _RimPower ("RimPower", Range(0,10)) = 0.5
    }
    
    SubShader 
    {
      Tags {"Queue" = "Transparent"}
    
    Pass 
    {
        Zwrite On
        ColorMask 0
    }
    
    
      CGPROGRAM
        #pragma surface surf Lambert alpha:fade
         
        struct Input 
        {
            float3 viewDir;
            float3 worldPos;
        };
        
        float4 _RimColor;
        float _RimPower;
        
        void surf (Input IN, inout SurfaceOutput o)
        {
            half rim = 1 - saturate(dot(normalize(IN.viewDir), o.Normal));
            
            o.Emission = rim * _RimColor;
            o.Alpha = pow (rim, _RimPower);
        }
      
      ENDCG
    }
    FallBack "Diffuse"
}