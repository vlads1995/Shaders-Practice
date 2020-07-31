using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AutoRotation : MonoBehaviour
{
    [SerializeField, Range(-2,2)] private float speed = 0;
    
    void Update()
    {
        transform.Rotate(0,speed,0);
    }
}
