using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class HUD : MonoBehaviour
{
    [SerializeField] private Image frog1, frog2, frog3, frog4;
    [SerializeField] private Text timer; 
    [SerializeField] private Player player;
    [SerializeField] private GameObject GameOverPanel;

    void Start()
    {
        Init();
    }

    // Update is called once per frame
    void Update()
    {
        timer.text = Mathf.Round(player.gameTimer).ToString();
        UpdateHUD();
    }

    void UpdateHUD()
    {
        if ( player.gameOver )
            GameOverPanel.SetActive(true);

        switch ( player.lives )
        {
            case 5:
                frog1.gameObject.SetActive(true);
                frog2.gameObject.SetActive(true);
                frog3.gameObject.SetActive(true);
                frog4.gameObject.SetActive(true);
                break;
            case 4:
                frog1.gameObject.SetActive(true);
                frog2.gameObject.SetActive(true);
                frog3.gameObject.SetActive(true);
                frog4.gameObject.SetActive(false);

                break;
            case 3:
                frog1.gameObject.SetActive(true);
                frog2.gameObject.SetActive(true);
                frog3.gameObject.SetActive(false);
                frog4.gameObject.SetActive(false);
                break;
            case 2:
                frog1.gameObject.SetActive(true);
                frog2.gameObject.SetActive(false);
                frog3.gameObject.SetActive(false);
                frog4.gameObject.SetActive(false);
                break;
            case 1:
                frog1.gameObject.SetActive(false);
                frog2.gameObject.SetActive(false);
                frog3.gameObject.SetActive(false);
                frog4.gameObject.SetActive(false);
                break;
        }
    }

    void Init()
    {



        frog1.gameObject.SetActive(true);
        frog2.gameObject.SetActive(true);
        frog3.gameObject.SetActive(true);
        frog4.gameObject.SetActive(true);



    }
}
