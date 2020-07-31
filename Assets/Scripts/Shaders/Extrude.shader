﻿Shader "Custom/Extrude"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Extrude ("Extrude Force", Range(0,2)) = 0
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert vertex:vert

        sampler2D _MainTex;
        float _Extrude;

        struct Input
        {
            float2 uv_MainTex;
        };
        
        struct appdata {
            float4 vertex : POSITION;
            float3 normal : NORMAL;
            float4 texcoord : TEXCOORD0;
        };

        void vert(inout appdata_full v)
        {
            v.vertex.xyz += v.normal * _Extrude ;
        }

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D (_MainTex, IN.uv_MainTex).rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
