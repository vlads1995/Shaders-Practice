using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

namespace Shaders.CustomEditor
{
    public class BaseShaderGUI : ShaderGUI
    {
        protected virtual void DrawCullingProps(MaterialEditor editor, MaterialProperty[] properties)
        {
            editor.ShaderProperty(FindProperty("_Cull", properties), "Cull");
            editor.ShaderProperty(FindProperty("_ZTest", properties), "ZTest"); 
        } 
    }
}


