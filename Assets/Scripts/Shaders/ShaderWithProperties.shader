Shader "MyShader/ShaderWithProperties"
{
    Properties
    {
        _myTexx ("Diffuse Texture 2D", 2D) = "white" {}
        _emissive ("Emissive Texture 2D", 2D) = "black" {}
        _myNormal ("Normal Texture 2D", 2D) = "white" {}
    }
    
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _myTexx;
        sampler2D _emissive;
        sampler2D _myNormal;
        
        struct Input
        {
            float2 uv_myTexx;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_myTexx, IN.uv_myTexx);
            o.Emission = tex2D(_emissive, IN.uv_myTexx);
            o.Normal = tex2D(_myNormal, IN.uv_myTexx);
        }
        ENDCG
    }
    
    FallBack "Diffuse"
}
