using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TrunkSpawner : MonoBehaviour
{
    public enum Direction { Left = -1, Right = 1, Stop = 0 }


    [SerializeField] private float speed = 1;
    [SerializeField] private float trunkSpeed = 1;
    [SerializeField] private GameObject toSpawn;
    [SerializeField] private int spawnNumber = 0;
    [SerializeField] private float _counter = 0;
    private int _spawnCounter = 0;
   // private int subMergeIndex;

    public List<GameObject> _spawned = new List<GameObject>();
    public List<Trunk> _spawnedComponents = new List<Trunk>();
    private GameObject _spawn;
    private Trunk _spawnComponent;
    public Direction dir;

    public string parentTag;
    public float timer = 3f;


    private void Start()
    {
        timer *= toSpawn.transform.localScale.x;
    }

    void Update()
    {

        if(_spawned.Count!=0)
        {

        }

        if ( _counter <= timer )
        {
            _counter += Time.deltaTime * speed;
            return;
        }
        else
        {
            if ( _spawned.Count >= spawnNumber )
                return;
            Spawn();
            _counter = 0;
        }
    }

    private void Spawn()
    {
        _spawnCounter += 1;
        _spawn = Instantiate(toSpawn, new Vector3(transform.position.x, transform.position.y, transform.position.z), Quaternion.identity, GameObject.FindGameObjectWithTag(parentTag).transform) as GameObject;

        foreach ( Trunk t in _spawn.GetComponentsInChildren<Trunk>() )
        {
            t._spawner = this;
            t._spawner.speed = trunkSpeed;
            _spawnedComponents.Add(t);
        }

        _spawned.Add(_spawn);

    }
}
