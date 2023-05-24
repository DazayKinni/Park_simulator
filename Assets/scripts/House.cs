using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class House : MonoBehaviour
{
    [SerializeField] GameObject roof;
    [SerializeField] GameObject interior;
    
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    private void OnTriggerEnter2D(Collider2D collision)
    {
        if(collision.gameObject.tag == "Player")
        {
            if(roof.activeSelf == true)
            {
                roof.SetActive(false);
                interior.SetActive(true);
            }
            else
            {
                roof.SetActive(true); 
                interior.SetActive(false);
            }
           
            
        }
    }


   

}
