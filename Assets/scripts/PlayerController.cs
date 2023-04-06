using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{

    Rigidbody2D body;
    

    float horizontal;
    float vertical;

    [SerializeField] float playerSpeed = 20.0f;
    Animator anim;

    
    

    void Start()
    {
        body = GetComponent<Rigidbody2D>();
        anim = GetComponent<Animator>();
    }

    void Update()
    {
        
        
        MovePlayer();
        MovementAnimation();
       ;
    }
    void MovePlayer()
    {
        horizontal = Input.GetAxisRaw("Horizontal");
        vertical = Input.GetAxisRaw("Vertical");
        if (Mathf.Abs(horizontal) > 0.5f) vertical = 0;
        else horizontal = 0;
        body.velocity = new Vector2(horizontal * playerSpeed, vertical * playerSpeed);
    }

    void MovementAnimation()
    {
        if (vertical >= 0.5f) anim.SetInteger("anim", 1);
        else if (vertical <= -0.5f) anim.SetInteger("anim", 2);
        else if (horizontal >= 0.5f) anim.SetInteger("anim", 4);
        else if (horizontal <= -0.5f) anim.SetInteger("anim", 3);
        else anim.SetInteger("anim", 0);
    }


}