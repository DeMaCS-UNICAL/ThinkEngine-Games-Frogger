using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(Collider))]

public class Turtle : Tile
{
    public Vector3 position;
    private Collider turtleCollider;
    public TurtleSpawner _spawner=null;
    public float speed=1;

    // Start is called before the first frame update
    void Start()
    {
        position = transform.position;
        turtleCollider = transform.GetComponent<Collider>();
    }

    // Update is called once per frame
    void Update()
    {

        if ( !_spawner )
            return;

        if ( _spawner.dir == TurtleSpawner.Direction.Left )
            transform.position = new Vector3(transform.position.x - 1 *(Time.deltaTime*speed), transform.position.y, transform.position.z);
        else
            transform.position = new Vector3(transform.position.x + 1 * (Time.deltaTime * speed), transform.position.y, transform.position.z);

        position = transform.position;
        posX = Mathf.RoundToInt(transform.position.x);
        posZ = Mathf.RoundToInt(transform.position.z);
    }

    private void OnTriggerExit(Collider other)
    {

        if(other.TryGetComponent<DeadLine>(out DeadLine component))
        {
            if ( _spawner.dir == TurtleSpawner.Direction.Left && component.type == Cord.W)
            {
                if ( this.transform.parent.childCount == 1 )
                {
                    _spawner._spawned.Remove(this.gameObject.transform.parent.gameObject);
                    Object.Destroy(this.gameObject.transform.parent.gameObject);
                }
                _spawner._spawnedComponents.Remove(this.GetComponent<Turtle>());
                Object.Destroy(this.gameObject);
            }

            if( _spawner.dir == TurtleSpawner.Direction.Right && component.type==Cord.E)
            {
                if ( this.transform.parent.childCount == 1 )
                {
                    _spawner._spawned.Remove(this.gameObject.transform.parent.gameObject);
                    Object.Destroy(this.gameObject.transform.parent.gameObject);
                }
                _spawner._spawnedComponents.Remove(this.GetComponent<Turtle>());
                Object.Destroy(this.gameObject);
            }
        }


        //if( _spawner.dir == TurtleSpawner.Direction.Left && other.GetComponent<DeadLine>().type==Cord.W  )
        //{
        //    if ( this.transform.parent.childCount == 1 )
        //    {
        //        _spawner._spawned.Remove(this.gameObject.transform.parent.gameObject);
        //        Object.Destroy(this.gameObject.transform.parent.gameObject);
        //    }
        //    Object.Destroy(this.gameObject);  
        //}

        //if(_spawner.dir==TurtleSpawner.Direction.Right && other.GetComponent<DeadLine>().type == Cord.E)
        //{
        //    if ( this.transform.parent.childCount == 1 )
        //    {
        //        _spawner._spawned.Remove(this.gameObject.transform.parent.gameObject);
        //        Object.Destroy(this.gameObject.transform.parent.gameObject);
        //    }
        //    Object.Destroy(this.gameObject);
        //}
    }
}
