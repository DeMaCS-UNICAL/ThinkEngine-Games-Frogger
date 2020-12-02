using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ScrollLine : MonoBehaviour
{
    private enum Direction { Left=-1,Right=1,Stop=0}
    [SerializeField] private  Direction dir=Direction.Stop;
    public int nLap;
    public float speed;
    private Vector3 position;
    private float delta;
    public List<Car> carComponents = new List<Car>();


    private void Start()
    {
        foreach(Transform t in transform)
        {
            if(t.TryGetComponent<Car>(out Car c))
            {
                carComponents.Add(c);
            }
        }
    }

    // Update is called once per frame
    void Update()
    {
        delta = Time.deltaTime;
        position = transform.localPosition;

        if ( dir == Direction.Stop )
            return;
        if ( dir == Direction.Right )
        {
            position.x += 1*speed*delta;
        }
        else
            position.x -= 1*speed*delta;

        if ( position.x >= nLap && dir==Direction.Right )
            position.x = 0;
        else if( position.x <= nLap*-1 && dir == Direction.Left )
            position.x = 0;


        transform.localPosition = position;

     }
}
