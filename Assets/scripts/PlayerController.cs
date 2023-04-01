using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{

    Rigidbody2D body;
    [SerializeField] ParticleSystem skillVFX;
    [SerializeField] GameObject skillDisplay;

    float horizontal;
    float vertical;

    [SerializeField] float playerSpeed = 20.0f;
    Animator anim;

    bool isSkillsReloaded = true;
    bool isBusy = false;

    void Start()
    {
        body = GetComponent<Rigidbody2D>();
        anim = GetComponent<Animator>();
    }

    void Update()
    {
        if (isBusy == true) return;
        SkillHandle();
        MovePlayer();
        MovementAnimation();
        AttackSword();
    }

    void SkillHandle()
    {
        if (isSkillsReloaded == false) return;
        if (Input.GetKeyDown(KeyCode.F))
        {
            StartCoroutine(StartSkill());
        }
    }

    IEnumerator StartSkill()
    {
        skillDisplay.SetActive(false);
        isSkillsReloaded = false;
        skillVFX.Play();
        yield return new WaitForSeconds(0.1f);
        DamageEnemies();
        yield return new WaitForSeconds(10);
        isSkillsReloaded = true;
        skillDisplay.SetActive(true);
    }

    void DamageEnemies()
    {
        EnemyHealth[] enemies = FindObjectsOfType<EnemyHealth>();
        for (int i = 0; i < enemies.Length; i++)
        {
            float distance = Vector2.Distance(transform.position, enemies[i].transform.position);
            if (distance < 2) enemies[i].GetDamage(20);
        }
    }


    void AttackSword()
    {
        if (Input.GetKeyDown(KeyCode.Q))
        {
            StartCoroutine(AttackCoroutine());
        }
    }

    IEnumerator AttackCoroutine()
    {
        isBusy = true;
        anim.SetInteger("anim", 5);
        yield return new WaitForSeconds(0.3f);
        isBusy = false;
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