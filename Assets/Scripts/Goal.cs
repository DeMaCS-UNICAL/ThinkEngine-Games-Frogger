using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Goal : Tile
{
    public Vector3 position;
    private Collider dlCollider;
    public bool empty = true;
    void Start()
    {
        position = transform.position;
        dlCollider = transform.GetComponent<Collider>();

    }

    private void Update()
    {
        posX = Mathf.RoundToInt(transform.position.x);
        posZ = Mathf.RoundToInt(transform.position.z);
    }

}
