Shader "Custom/TransparencyLeaves"
{
    Properties
    { 
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Transparency ("Transparency", Range(0,1)) = 0.0  
    }
    SubShader
    {
        Tags { "Queue"="Transparent" }
      
        CGPROGRAM
        #pragma surface surf Lambert alpha:fade
     
        sampler2D _MainTex;
        half _Transparency;

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            fixed4 c = tex2D(_MainTex, IN.uv_MainTex);
            o.Albedo = c.rgb;
            o.Alpha = c.a ;//* _Transparency;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
