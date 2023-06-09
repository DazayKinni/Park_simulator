using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    //Variables
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
    [Space]
    [Header("Weapon")]
    [SerializeField] GameObject sword;
    private SpriteRenderer srSword;
    
    
    //Start
    void Start()
    {
        body = GetComponent<Rigidbody2D>();
        anim = GetComponent<Animator>();
        sr = GetComponent<SpriteRenderer>();
        srSword = sword.GetComponent<SpriteRenderer>(); 
    }
    //FixedUpdate
    void FixedUpdate()
    {
        MovePlayer();
        MovementAnimation();  
    }
    //Update
    private void Update()
    {
        Attack();
        Roll();
    }
    //Player's Movement
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
    //Animations for Movement
    void MovementAnimation()
    {
        float currentSpeed = body.velocity.sqrMagnitude;
        anim.SetFloat("Speed", currentSpeed);
        if(horizontal < 0)
        {
            sr.flipX = true;
            srSword.flipX = true;
        }
        else if(horizontal > 0)
        {
            sr.flipX=false;
            srSword.flipX = false;
        }
    }
    //Attack
    private void Attack()
    {
        if (Input.GetKeyDown(KeyCode.F) &&
            anim.GetCurrentAnimatorClipInfo(0)[0].clip.name != "Attack")
        {
            anim.SetTrigger("Attack");
            ActivateSword();
            Invoke("DeactivateSword", 0.833f);
        }

    }
    //Roll
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
        //draw a circle which shows radius of attack 
        Gizmos.color = Color.yellow;
        Gizmos.DrawWireSphere(transform.position + attackOffset, attackradius);
    }
    private void ActivateSword()
    {
        sword.SetActive(true);
    }
    private void DeactivateSword()
    {
        sword.SetActive(false);
    }




}