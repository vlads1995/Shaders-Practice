Shader "Custom/TransparentForParticles"
{
     Properties
    { 
        _MainTex ("Texture", 2D) = "black" {} 
        [Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Float) = 0
    }
   
    SubShader
    {
        Tags { "Queue"="Transparent" }
       
       Blend SrcAlpha OneMinusSrcAlpha
       
       Cull [_Cull]
       
       Pass
       {
            SetTexture [_MainTex] {combine texture}
       }
       
    }
    FallBack "Diffuse"
   
}
