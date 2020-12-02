using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SubMerge : MonoBehaviour
{
    List<Transform> turtles=new List<Transform>();
    private int tGroupIndex;
    private int tGroupIndexMirror;

    private float startPosY;

   // public float timerChange=30f;

    void Start()
    {
        foreach ( Transform child in transform )
        {
            turtles.Add(child);
        }

        SelectGroup();
    }

    // Update is called once per frame
    void Update()
    {
        //if ( timerChange > 0 )
        //    timerChange -= Time.deltaTime;
        //else
        //{
        //    timerChange = 30;

        //    turtles[tGroupIndex].gameObject.SetActive(true);
        //    turtles[tGroupIndexMirror].gameObject.SetActive(true);
        //  //  turtles[tGroupIndex].localPosition =new Vector3(turtles[tGroupIndex].localPosition.x, startPosY, turtles[tGroupIndex].localPosition.z);
        // //   turtles[tGroupIndexMirror].localPosition = new Vector3(turtles[tGroupIndexMirror].localPosition.x, startPosY, turtles[tGroupIndexMirror].localPosition.z);
        //    SelectGroup();
        //}
    }

    void SelectGroup()
    {
        tGroupIndex = Random.Range(1, 5);
        tGroupIndexMirror = tGroupIndex + 5;

        startPosY = turtles[tGroupIndex].transform.localPosition.y;
        turtles[tGroupIndex].gameObject.SetActive(false);
        turtles[tGroupIndexMirror].gameObject.SetActive(false);
        //turtles[tGroupIndex].localPosition = new Vector3(turtles[tGroupIndex].localPosition.x, startPosY - 0.5f, turtles[tGroupIndex].localPosition.z);
        // turtles[tGroupIndexMirror].localPosition = new Vector3(turtles[tGroupIndexMirror].localPosition.x, startPosY - 0.5f, turtles[tGroupIndexMirror].localPosition.z);

    }
}
