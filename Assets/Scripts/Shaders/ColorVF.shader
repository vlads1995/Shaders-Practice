Shader "Unlit/ColorVF"
{

    Properties 
	{
		_RPos("RPos paint", Range(-10,10)) = 0
		_RSpread("RSpread paint", Range(-10,10)) = 1
		
		_GPos("GPos paint", Range(-10,10)) = 0
		_GSpread("GSpread paint", Range(-10,10)) = 1
		
		_BPos("BPos paint", Range(-10,10)) = 0
		_BSpread("BSpread paint", Range(-10,10)) = 1
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

            struct appdata
            {
                float4 vertex : POSITION;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float4 color : COLOR; 
            };

            v2f vert (appdata v)
            {
                v2f o;
                UNITY_INITIALIZE_OUTPUT(v2f, o);
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.color.r = (v.vertex.x + _RPos)/_RSpread;
                o.color.g = (v.vertex.y + _GPos)/_GSpread; 
                o.color.b = (v.vertex.z + _BPos)/_BSpread; 
                return o; 
            }

            fixed4 frag (v2f i) : SV_Target
            { 
                fixed4 col = i.color; 
                return col;
            }
            ENDCG
        }
    }
}
