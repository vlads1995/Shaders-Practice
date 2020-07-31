Shader "Custom/BlendTest"
{
    Properties
    { 
        _MainTex ("Texture", 2D) = "white" {} 
        [Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Float) = 0
    }
   
    SubShader
    {
        Tags { "Queue"="Transparent" }
       
       Blend One One
       
       Cull [_Cull]
       
       Pass
       {
            SetTexture [_MainTex] {combine texture}
       }
       
    }
    FallBack "Diffuse"
   
}
