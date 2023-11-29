using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class EnemyHealth : MonoBehaviour
{
    [SerializeField] float health = 50;
    [SerializeField] float maxhealth = 50;

    [SerializeField] private Image healthBar;
    Animator animator;

    private void Start()
    {
        animator = GetComponent<Animator>();    
    }
    private void Update()
    {
        HealthRender();
    }

    public void GetDamage(float damage)
    {
        animator.SetTrigger("Hurt");
        health -= damage;
        
        if(health < 0.01f)
        {
            Destroy(gameObject);
        }
    }

    void HealthRender()
    {
        healthBar.fillAmount = (float)health / maxhealth;
    }

    
}

