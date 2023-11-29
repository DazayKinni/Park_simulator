using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.UI;
using Cinemachine;

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
    [Header("Weapo0n")]
    [SerializeField] GameObject sword;
    private SpriteRenderer srSword;
    float maxStamina = 100;
    float stamina = 100;
    [SerializeField] float deltaStaminaRoll = 30;
    [SerializeField] float deltaStaminaAttack = 20;
    [SerializeField] Image staminaImage;
    float staminaRegenSpeed = 10;
    [SerializeField] float playerDamage = 10;
    CinemachineImpulseSource impulseSource;


    //Start
    void Start()
    {
        body = GetComponent<Rigidbody2D>();
        anim = GetComponent<Animator>();
        sr = GetComponent<SpriteRenderer>();
        srSword = sword.GetComponent<SpriteRenderer>();
        stamina = maxStamina;
        StartCoroutine("StaminaRegeneration");
        impulseSource = GetComponent<CinemachineImpulseSource>();   
        
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
            attackOffset.x = -Mathf.Abs(attackOffset.x);
        }
        else if(horizontal > 0)
        {
            sr.flipX=false;
            srSword.flipX = false;
            attackOffset.x = Mathf.Abs(attackOffset.x);
        }
    }
    //Attack
    private void Attack()
    {
        if (Input.GetKeyDown(KeyCode.F) &&
            anim.GetCurrentAnimatorClipInfo(0)[0].clip.name != "Attack" && stamina >= deltaStaminaAttack)
        {
            stamina -= deltaStaminaAttack;
            anim.SetTrigger("Attack");
            ActivateSword();
            Invoke("DeactivateSword", 0.833f);
            RenderStamina();

            
            
        }

    }
    //Roll
    private void Roll()
    {
        if (Input.GetKeyDown(KeyCode.Q) &&
                anim.GetCurrentAnimatorClipInfo(0)[0].clip.name == "Walk" && stamina >= deltaStaminaRoll)
        {
            stamina -= deltaStaminaRoll;
            anim.SetTrigger("Roll");
            body.AddForce(body.velocity.normalized * rollStrenght, ForceMode2D.Impulse);
            RenderStamina();

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

    void RenderStamina()
    {
        staminaImage.fillAmount = (float)stamina / maxStamina;
    }

    IEnumerator StaminaRegeneration()
    {
        while (true)
        {
            if(stamina < maxStamina)
            {
                stamina += staminaRegenSpeed/24.0f;
                if (stamina > maxStamina)
                {
                    stamina = maxStamina;
                }

            }
            RenderStamina();
            yield return new WaitForSeconds(1/24.0f);
             
        }
    }
    public void CheckAttack()
    {
        impulseSource.GenerateImpulse();
        Collider2D[] colliders = Physics2D.OverlapCircleAll(transform.position + attackOffset, attackradius);
        for (int i = 0; i < colliders.Length; i++)
        {
            if (colliders[i].gameObject.tag == "Enemy")
            {
                EnemyHealth enemyHealth = colliders[i].GetComponent<EnemyHealth>();
                enemyHealth.GetDamage(playerDamage);
            }
        }
    }




}