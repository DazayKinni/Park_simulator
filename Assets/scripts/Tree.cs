using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Tree : MonoBehaviour
{
    int amountOfColliders = 0;
    SpriteRenderer spriteRenderer;
    
    //start
    void Start()
    {
        spriteRenderer = GetComponent<SpriteRenderer>();

        
    }
    //aktualizacja
    void Update()
    {
       
    }

    private void OnTriggerEnter2D(Collider2D collision)
    {
        if (collision.gameObject.tag == "Player" || collision.gameObject.tag == "Enemy")
        {
            amountOfColliders++; 
            Color color = spriteRenderer.color;
            color.a = 0.5f;
            spriteRenderer.color = color;
        }
    }

    private void OnTriggerExit2D(Collider2D collision)
    {
        if (collision.gameObject.tag == "Player" || collision.gameObject.tag == "Enemy")
        {
            amountOfColliders--;
            if ( amountOfColliders == 0)
            {
                Color color = spriteRenderer.color;
                color.a = 1;
                spriteRenderer.color = color;
            }
            
            
        }



    }
}
