Shader "Custom/DotShader"
{ 
    SubShader 
    {

      CGPROGRAM
        #pragma surface surf Lambert
         
        struct Input 
        {
            float3 viewDir;
        };
        
        void surf (Input IN, inout SurfaceOutput o)
        {
            //o.Albedo = float3(dot(IN.viewDir, o.Normal),1,1-dot(IN.viewDir, o.Normal`));
            o.Albedo = float3(dot(IN.viewDir, o.Normal),1,1);
           
        }
      
      ENDCG
    }
    FallBack "Diffuse"
    
}