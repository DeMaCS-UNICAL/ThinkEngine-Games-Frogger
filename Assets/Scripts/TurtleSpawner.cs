using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics.Tracing;
using System.Linq;
using UnityEditor.Experimental.GraphView;
using UnityEngine;
using Random = UnityEngine.Random;

public class TurtleSpawner : MonoBehaviour
{
    public enum Direction { Left = -1, Right = 1, Stop = 0 }


    [SerializeField]private float speed=1;
    [SerializeField]private float turtleSpeed=1;
    [SerializeField]private GameObject toSpawn;
    [SerializeField] private int spawnNumber=0;
    [SerializeField] private float _counter=0;
    private int _spawnCounter=0;
    private int subMergeIndex;

    public List<GameObject> _spawned= new List<GameObject>();
    public List<Turtle> _spawnedComponents = new List<Turtle>();
    private GameObject _spawn;
    public Direction dir;

    public string parentTag;
    public float timer=3f;


    private void Start()
    {
        subMergeIndex = Random.Range(2, 10);
    }

    // Update is called once per frame
    void Update()
    {
       

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


        if ( _spawnCounter % subMergeIndex != 0 )
           _spawn.transform.position = new Vector3(transform.position.x, transform.position.y, transform.position.z);
        else
           _spawn.transform.position = new Vector3(transform.position.x, transform.position.y-.5f, transform.position.z);

            //switch ( dir )
            //{
            //    case Direction.Left:
            //        if(_spawnCounter%subMergeIndex != 0)
            //             _spawn.transform.position = new Vector3(transform.position.x, transform.position.y, transform.position.z);
            //        else
            //            _spawn.transform.position = new Vector3(transform.position.x, transform.position.y-.5f, transform.position.z);
            //        break;
            //    case Direction.Right:
            //        if ( _spawnCounter % subMergeIndex != 0 )
            //            _spawn.transform.position = new Vector3(transform.position.x, transform.position.y, transform.position.z);
            //        else
            //            _spawn.transform.position = new Vector3(transform.position.x, transform.position.y-.5f, transform.position.z);

            //        break;
            //    case Direction.Stop:
            //        break;
            //}

            foreach ( Turtle t in _spawn.GetComponentsInChildren<Turtle>() )
        {
            t._spawner = this;
            t._spawner.speed = turtleSpeed;
            _spawnedComponents.Add(t);
        }
       
       _spawned.Add(_spawn);

    }
}
