using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Trunk : Tile
{
    public Vector3 position;
    private Collider trunkCollider;
    public TrunkSpawner _spawner = null;
    public float speed = 1;
    public int dim;

    // Start is called before the first frame update
    void Start()
    {
        position = transform.position;
        trunkCollider = transform.GetComponent<Collider>();
    }

    // Update is called once per frame
    void Update()
    {
        if ( !_spawner )
            return;

        if ( _spawner.dir == TrunkSpawner.Direction.Left )
            transform.position = new Vector3(transform.position.x - 1 * (Time.deltaTime * speed), transform.position.y, transform.position.z);
        else
            transform.position = new Vector3(transform.position.x + 1 * (Time.deltaTime * speed), transform.position.y, transform.position.z);

        position = transform.position;
        posX = Mathf.RoundToInt(transform.position.x);
        posZ = Mathf.RoundToInt(transform.position.z);
    }

    private void OnTriggerExit(Collider other)
    {
        if ( other.TryGetComponent<DeadLine>(out DeadLine component) )
        {
            if ( _spawner.dir == TrunkSpawner.Direction.Left && component.type == Cord.W )
            {
                _spawner._spawned.Remove(this.gameObject);
                _spawner._spawnedComponents.Remove(this.GetComponent<Trunk>());
                Object.Destroy(this.gameObject);
            }

            if ( _spawner.dir == TrunkSpawner.Direction.Right && component.type == Cord.E )
            {
                _spawner._spawned.Remove(this.gameObject);
                _spawner._spawnedComponents.Remove(this.GetComponent<Trunk>());
                Object.Destroy(this.gameObject);
            }
        }
    }
}
