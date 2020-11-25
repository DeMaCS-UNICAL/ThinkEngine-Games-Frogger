using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(Collider))]

public class Water : MonoBehaviour
{

    public Vector3 position;
    private Collider waterCollider;
    bool triggered;

    // Start is called before the first frame update
    void Start()
    {
        position = transform.position;
        waterCollider = transform.GetComponent<Collider>();
    }

    private void Update()
    {
        triggered = waterCollider.isTrigger;
    }

    //private void OnTriggerEnter(Collider other)
    //{
    //    if(other.transform.GetComponent<Turtle>())
    //    {
    //        waterCollider.isTrigger = false;
    //    }
    //}

    private void OnTriggerExit(Collider other)
   {
       if( other.transform.GetComponent<Turtle>())
        {
           waterCollider.isTrigger = true;
        } 
        if ( other.transform.GetComponent<Trunk>() )
        {
           waterCollider.isTrigger = true;
        }

    }

    private void OnTriggerStay(Collider other)
    {

        if ( other.transform.GetComponent<Turtle>() )
        {
            waterCollider.isTrigger = false;
        } 
        if ( other.transform.GetComponent<Trunk>() )
        {
            waterCollider.isTrigger = false;
        }
    }
}
