using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;



namespace Shaders.CustomEditor
{
    public class ShaderGUIWithProps : BaseShaderGUI
    {
        public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
        {
            base.OnGUI(materialEditor, properties);
            
            
            EditorGUI.BeginChangeCheck();
            
            //DrawCullingProps(materialEditor, properties);
        
            if (EditorGUI.EndChangeCheck())
            {
               
            }

        }
    }
}
