using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(Collider))]
public class Car : Tile
{

    public Vector3 position;
    private Collider carCollider;
    void Start()
    {
        position = transform.position;
        carCollider = transform.GetComponent<Collider>();
    }

    // Update is called once per frame
    void Update()
    {
        position = transform.position;
        posX = Mathf.RoundToInt(transform.position.x);
        posZ = Mathf.RoundToInt(transform.position.z);
    }
}
