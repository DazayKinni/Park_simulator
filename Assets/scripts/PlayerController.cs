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
    [Header("Attack prefs")]
    [SerializeField] float attackradius = 1;
    [SerializeField] Vector3 attackOffset = new Vector3(1, 0, 0);

    
    

    void Start()
    {
        body = GetComponent<Rigidbody2D>();
        anim = GetComponent<Animator>();
    }

    void FixedUpdate()
    {
        
        
        MovePlayer();
        MovementAnimation();
        Attack();
    }
    void MovePlayer()
    {
        horizontal = Input.GetAxis("Horizontal");
        vertical = Input.GetAxis("Vertical");
        if (Mathf.Abs(horizontal) > 0.5f) vertical = 0;
        else horizontal = 0;
        body.velocity = new Vector2(horizontal, vertical) * playerSpeed;
    }

    void MovementAnimation()
    {
        if (vertical >= 0.5f) anim.SetInteger("anim", 1);
        else if (vertical <= -0.5f) anim.SetInteger("anim", 2);
        else if (horizontal >= 0.5f) anim.SetInteger("anim", 4);
        else if (horizontal <= -0.5f) anim.SetInteger("anim", 3);
        else anim.SetInteger("anim", 0);
    }

    private void Attack()
    {

    }
    private void OnDrawGizmos()
    {
        Gizmos.color = Color.yellow;
        Gizmos.DrawWireSphere(transform.position + attackOffset, attackradius);
    }


}