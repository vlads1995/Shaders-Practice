Shader "Unlit/ColorVFChallenge"
{

    Properties 
	{
	    _MainTex ("Texture", 2D) = "white" {}
	 
		_RPos("RPos paint", Range(-10,10)) = 0
		_RSpread("RSpread paint", Range(-10,10)) = 1 
	}

    SubShader
    {
        Tags { "RenderType"="Opaque" }
       
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
         
            #include "UnityCG.cginc"

            float _RPos;
            float _RSpread;
            float _GPos;
            float _GSpread;
            float _BPos;
            float _BSpread;

            sampler2D _MainTex;
 
            struct Input 
            {
                float2 uv_MainTex;
            };


            struct appdata
            {
                float4 vertex : POSITION;
                float4 texcoord : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
                float4 color : COLOR; 
            };
            
            float4 _MainTex_ST;

            v2f vert (appdata v)
            {
                v2f o; 
                UNITY_INITIALIZE_OUTPUT(v2f, o);
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.texcoord, _MainTex);
                o.color.r = o.uv.x;
                return o; 
            }

            fixed4 frag (v2f i) : SV_Target
            {  
                fixed4 col = tex2D(_MainTex, i.uv); 
                return col * i.color;
            }
            ENDCG
        }
    }
}
