using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum Cord { N, S, E, W };

[RequireComponent(typeof(Collider))]
public class DeadLine : MonoBehaviour
{
  
    public Cord type;
    public Vector3 position;
    private Collider dlCollider;
    void Start()
    {
        position = transform.position;
        dlCollider = transform.GetComponent<Collider>();
    }
}
