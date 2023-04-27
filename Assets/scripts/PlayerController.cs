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
    bool isBusy = false;
    private SpriteRenderer sr;
    [SerializeField] float rollStrenght = 5;
    
    

    void Start()
    {
        body = GetComponent<Rigidbody2D>();
        anim = GetComponent<Animator>();
        sr = GetComponent<SpriteRenderer>();
    }

    void FixedUpdate()
    {
        
        
        MovePlayer();
        MovementAnimation();
        
    }
    private void Update()
    {
        Attack();
        Roll();
    }
    void MovePlayer()
    {
        horizontal = Input.GetAxis("Horizontal");
        vertical = Input.GetAxis("Vertical");
        if (Mathf.Abs(horizontal) > 0.5f) vertical = 0;
        else horizontal = 0;
        
        if (anim.GetCurrentAnimatorClipInfo(0)[0].clip.name != "Roll")
        {
            body.velocity = new Vector2(horizontal, vertical) * playerSpeed;
        }
    }

    void MovementAnimation()
    {
        float currentSpeed = body.velocity.sqrMagnitude;
        anim.SetFloat("Speed", currentSpeed);
        if(horizontal < 0)
        {
            sr.flipX = true;
        }
        else if(horizontal > 0)
        {
            sr.flipX=false;
        }
    }

    private void Attack()
    {
        if (Input.GetKeyDown(KeyCode.F) &&
            anim.GetCurrentAnimatorClipInfo(0)[0].clip.name != "Attack")
        {
            anim.SetTrigger("Attack");
        }
    }
    private void Roll()
    {
        if (Input.GetKeyDown(KeyCode.Q) &&
                anim.GetCurrentAnimatorClipInfo(0)[0].clip.name == "Walk")
        {
            anim.SetTrigger("Roll");
            body.AddForce(body.velocity.normalized * rollStrenght, ForceMode2D.Impulse);

        }
    }
    private void OnDrawGizmos()
    {
        Gizmos.color = Color.yellow;
        Gizmos.DrawWireSphere(transform.position + attackOffset, attackradius);
    }


}