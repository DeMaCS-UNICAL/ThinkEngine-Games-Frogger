using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum Movement { UP, DOWN, RIGHT, LEFT, IDLE, STILL }


[RequireComponent(typeof(Collider))]
[RequireComponent(typeof(Rigidbody))]
[RequireComponent(typeof(Animator))]

public class Player : Tile
{
    public string answerA = "STILL";
    //public string answerB = "STILL";


    public bool execute = false;
    public int executeCount = 0;
    public bool enableAi = false;

    private float _actionDelay = 0;
    public bool inAction;

    public bool onPlatform = false;

    public int lives = 10;
    private Vector3 originalPos;
    public float gameTime = 30;
    public float warningTime = 5;
    public float gameTimer;
    private int goalCount = 0;
    public Vector3 velocity;

    public GameObject playerPrefab;

    public bool dead = false;
    public Movement move = Movement.IDLE;

    public bool normalized = false;

    private Rigidbody rigid;
    private Collider playerCollider;
    private Animator anim;
    internal bool gameOver;

    void Start()
    {
        answerA = "STILL";
        //answerB = "STILL";

      

        originalPos = transform.position;
        playerCollider = transform.GetComponent<Collider>();
        anim = transform.GetComponent<Animator>();
        rigid = GetComponent<Rigidbody>();
        velocity = rigid.velocity;

        anim.applyRootMotion = false;

    }

    void Update()
    {
        StartCoroutine(DeadState());

        posX = Mathf.RoundToInt(transform.position.x);
        posZ = Mathf.RoundToInt(transform.position.z);

        if ( dead )
        {
            executeCount = 0;
            execute = false;
            answerA = "STILL";
            //answerB = "STILL";
            return;
        }
        if ( lives == 0 )
        {
            gameOver = true;
            return;
        }
        if ( gameTimer < gameTime )
            gameTimer += Time.deltaTime;

        if ( !enableAi )
            InputHandler();
        else
            InputHandleAI();

        UpdatePosition();
        CheckStates();
    }

    private void CheckStates()
    {
        if ( !onPlatform )
        {
            rigid.velocity = velocity;
            transform.parent = GameObject.FindGameObjectWithTag("Operators").transform;
        }

       // Debug.Log("OnPlatform:" + onPlatform);
        RaycastCheck();
    }

    private void RaycastCheck()
    {
        Vector3 rayCastOffSet = new Vector3(0, 0.4f, 0);

        if ( Physics.Raycast(transform.position+rayCastOffSet, transform.TransformDirection(Vector3.down), out RaycastHit hit, Mathf.Infinity) )
        {
            Debug.DrawRay(transform.position, transform.TransformDirection(Vector3.down) * hit.distance, Color.blue);

            if ( (hit.transform.GetComponent<Turtle>() || hit.transform.GetComponent<Trunk>()) && !onPlatform ) //&& !inAction
            {
                if ( !onPlatform && !inAction ) //Modifica da controllare
                {
                    Debug.Log("Entro sulla tartaruga/tronco " + hit.transform);
                    transform.localPosition = Vector3.zero;
                    transform.position = new Vector3(hit.point.x, originalPos.y, hit.transform.position.z);
                    transform.parent = hit.transform;
                    onPlatform = true;
                }
            }


            if ( hit.transform.TryGetComponent<Water>(out Water component) && !onPlatform )
            {
                if ( component.GetComponent<Collider>().isTrigger )
                {
                    dead = true;
                    Debug.Log("Sono annegato " + hit.transform);
                }
            }

            if ( hit.transform.TryGetComponent<Goal>(out Goal goal) && !onPlatform )
            {
                if ( goal.empty )
                {
                    goalCount += 1;
                    dead = true;
                    goal.empty = false;
                    Debug.Log("TANA " + goal.transform);
                    GameObject go = Instantiate(playerPrefab, goal.transform.position, Quaternion.identity) as GameObject;
                    go.transform.localScale = new Vector3(3, 3, 3);
                }

                else
                {
                    dead = true;
                    Debug.Log("La tana è già occupata");
                }
            }
            //Debug.Log("Did Hit" + hit.transform);
        }
        else
        {
            Debug.DrawRay(transform.position, transform.TransformDirection(Vector3.down) * 1000, Color.red);
        }
    }

    private IEnumerator DeadState()
    {    
        if ( dead )
        {
            if ( lives > 0 )
            {
                onPlatform = false;
                transform.parent = GameObject.FindGameObjectWithTag("Operators").transform;
                lives = lives - 1;
                transform.position = originalPos;
                dead = false;

            }
            else
                Debug.Log("GAMEOVER");
                yield return new WaitForSeconds(3);
        }
    }

    private void UpdatePosition()
    {
        switch ( move )
        {
            case Movement.UP:
                transform.rotation = Quaternion.LookRotation(Vector3.forward, Vector3.back);
                if ( onPlatform )
                {

                   // RootMotion();
                    // rigid.velocity = velocity*100;
                    onPlatform = false;
                    transform.parent = GameObject.FindGameObjectWithTag("Operators").transform;
                    anim.SetTrigger("Jump");
                    Vector3 start = transform.position;
                    Vector3 end = new Vector3(transform.position.x, transform.position.y, transform.position.z + 2);
                    transform.position = Vector3.Lerp(start, end, 0.5f);
                }
                else
                {
                    anim.SetTrigger("Jump");
                    Vector3 start = transform.position;
                    Vector3 end = new Vector3(transform.position.x, transform.position.y, transform.position.z + 2);
                    transform.position = Vector3.Lerp(start, end, 0.5f);
                }

                inAction = true;
                break;
            case Movement.DOWN:
                transform.eulerAngles = new Vector3(0, 180, 0);
                if ( onPlatform )
                {
                   // RootMotion();
                    onPlatform = false;
                    transform.parent = GameObject.FindGameObjectWithTag("Operators").transform;
                    anim.SetTrigger("Jump");
                    Vector3 start = transform.position;
                    Vector3 end = new Vector3(transform.position.x, transform.position.y, transform.position.z - 2);
                    transform.position = Vector3.Lerp(start, end, 0.5f);
                }
                else
                {
                    Vector3 start = transform.position;
                    Vector3 end = new Vector3(transform.position.x, transform.position.y, transform.position.z - 2);
                    transform.position = Vector3.Lerp(start, end, 0.5f);
                    anim.SetTrigger("Jump");
                }
                inAction = true;

                break;
            case Movement.LEFT:
                transform.rotation = Quaternion.LookRotation(Vector3.left, Vector3.right);
                if ( onPlatform )
                {
                    //RootMotion();
                    onPlatform = false;
                    transform.parent = GameObject.FindGameObjectWithTag("Operators").transform;

                    anim.SetTrigger("Jump");
                    Vector3 start = transform.position;
                    Vector3 end = new Vector3(transform.position.x - 2, transform.position.y, transform.position.z);
                    transform.position = Vector3.Lerp(start, end, 0.7f);
                }
                else
                {
                    anim.SetTrigger("Jump");
                    Vector3 start = transform.position;
                    Vector3 end = new Vector3(transform.position.x - 2, transform.position.y, transform.position.z);
                    transform.position = Vector3.Lerp(start, end, 0.5f);
                }
                inAction = true;

                break;
            case Movement.RIGHT:
                transform.rotation = Quaternion.LookRotation(Vector3.right, Vector3.left);
                if ( onPlatform )
                {
                    //RootMotion();
                    onPlatform = false;
                    transform.parent = GameObject.FindGameObjectWithTag("Operators").transform;
                    anim.SetTrigger("Jump");
                    Vector3 start = transform.position;
                    Vector3 end = new Vector3(transform.position.x + 2, transform.position.y, transform.position.z);
                    transform.position = Vector3.Lerp(start, end, 0.5f);
                }
                else
                {
                    anim.SetTrigger("Jump");
                    Vector3 start = transform.position;
                    Vector3 end = new Vector3(transform.position.x + 2, transform.position.y, transform.position.z);
                    transform.position = Vector3.Lerp(start, end, 0.5f);
                }
                inAction = true;

                break;

            case Movement.IDLE:
                //anim.applyRootMotion = true;
                break;
        }

        if ( move != Movement.IDLE )
        {
            //normalized = true;
            move = Movement.IDLE;
        }



    }

    public void normalizePosition()
    {
        transform.position = new Vector3(Mathf.Round(transform.position.x), transform.position.y, Mathf.Round(transform.position.z));
    }

    private void InputHandleAI()
    {
        if ( !execute&&executeCount==2 )
            executeCount = 0;

        if ( inAction )
        {
            _actionDelay += Time.deltaTime;
        }

        if ( _actionDelay > .6f )
        {
            inAction = false;
            _actionDelay = 0;
        }
        else if ( _actionDelay != 0 )
        {
           // Debug.Log("NOPE");
        }

        if ( _actionDelay == 0)
        {
            execute = true;
            if(executeCount==0 )
            {
                parseAiMovement(answerA);
                answerA = "STILL";
                //executeCount++; //MODIFICATO MOSSA SINGOLA
                execute = false; //HA ESEGUITO LA MOSSA
            }
            //if ( executeCount == 1&&execute)
            //{
            //    parseAiMovement(answerB);
            //    answerB = "STILL";
            //    execute = false;
            //    executeCount++;
            //}
            normalizePosition();
        }
    }

    public bool validateAiMovement(string s)
    {
        Vector3 nativePos = transform.position;

        switch ( s )
        {
            case "up":
                break;
            case "down":
                break;
            case "left":
                break;
            case "right":
                break;
            case "still":
                break;
        }
        return true;
    }

    public void parseAiMovement(string s)
    {
        switch ( s )
        { 
            case "up":
                move = Movement.UP;
                break;
            case "down":
                move = Movement.DOWN;
                break;
            case "left":
                move = Movement.LEFT;
                break;
            case "right":
                move = Movement.RIGHT;
                break;
            case "still":
                move = Movement.IDLE;
                break;
        }
    }

    private void InputHandler()
    {

        if ( inAction )
        {
            _actionDelay += Time.deltaTime;
        }

        if ( _actionDelay > .5f )
        {
            inAction = false;
            _actionDelay = 0;         

        }   
        else if(_actionDelay!=0)
        {
            Debug.Log("NOPE");
        }

        if ( _actionDelay == 0 )
        {
            if ( Input.GetKeyDown(KeyCode.UpArrow) || Input.GetKeyDown(KeyCode.W) )
            {
                move = Movement.UP;
            }
            else if ( Input.GetKeyDown(KeyCode.LeftArrow) || Input.GetKeyDown(KeyCode.A) )
            {
                move = Movement.LEFT;
            }
            else if ( Input.GetKeyDown(KeyCode.RightArrow) || Input.GetKeyDown(KeyCode.D) )
            {
                move = Movement.RIGHT;
            }
            else if ( Input.GetKeyDown(KeyCode.DownArrow) || Input.GetKeyDown(KeyCode.S) )
            {
                move = Movement.DOWN;
            }
        }

    }

  public void executeAi(string X,string Y,string Z)
   { 
        if ( !execute )
        {
            execute = true;
            answerA = X;
            //answerB= Y;
            //answerC = Z;
        }
   }

    void RootMotion()
    {
        if ( anim.applyRootMotion )
            anim.applyRootMotion = false;
    }

    public bool isGrounded()
    {
        bool r = false;

        Vector3 origin = transform.position;
        Vector3 dir = Vector3.down;

        if ( Physics.Raycast(origin, dir, out RaycastHit hit, Mathf.Infinity) )
        {
            r = true;
            Vector3 targetPosition = hit.point + new Vector3(0, .35f, 0);
            transform.position = targetPosition;
        }
        else
            Debug.DrawRay(origin, dir * 1000, Color.blue);
        return r;
    }

    private void OnTriggerEnter(Collider other)
    {
        if ( other.transform.GetComponent<Car>() )
        {
            dead = true;
            transform.parent = GameObject.FindGameObjectWithTag("Operators").transform;
            //Debug.Log("Mi ha investito una macchina " + other.transform);
        }


        if ( other.GetComponent<DeadLine>() )
        {
            dead = true;
            //Debug.Log("Sono uscito fuori bordo " + other.transform);
            transform.parent = GameObject.FindGameObjectWithTag("Operators").transform;
        }

        //if ( other.GetComponent<Goal>() )
        //{
        //    if ( other.GetComponent<Goal>().empty )
        //    {
        //        goalCount += 1;
        //        dead = true;
        //        other.GetComponent<Goal>().empty = false;
        //        Debug.Log("TANA " + other.transform);
        //        GameObject go = Instantiate(playerPrefab, other.transform.position, Quaternion.identity) as GameObject;
        //        go.transform.localScale = new Vector3(3, 3, 3);
        //    }
        //    else
        //    {
        //        dead = true;
        //        Debug.Log("La tana è già occupata");
        //    }
        //}
    }

}
