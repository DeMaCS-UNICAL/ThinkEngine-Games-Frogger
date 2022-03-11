using System;
using UnityEngine;

// every method of this class returning a bool value can be used to trigger the sensors update.
 public class Trigger:ScriptableObject{


    public bool runTheReasoner()
    {
        //Debug.Log("In Esecuzione...");
        Player player = GameObject.FindObjectOfType<Player>();
        if ( player.execute || player.inAction )
        {
           // Debug.Log("Non Far partire il Resasoner");
            return false;
        }
        //Debug.Log("Parti pure...");
        return true;
    }


    public bool applyActuators()
    {
        Player player = GameObject.FindObjectOfType<Player>();
        if (player.dead || player.execute || player.inAction )
        {
            //Debug.Log("returning FALSE for actuators");

            return false;
        }

       // Debug.Log("returning true for actuators");
        return true;
    }
}