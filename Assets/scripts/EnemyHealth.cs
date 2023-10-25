using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class EnemyHealth : MonoBehaviour
{
    [SerializeField] float health = 50;

    [SerializeField] private Image healthBar;

    private void Start()
    {
        
    }

    public void GetDamage(float damage)
    {
        health -= damage;
        if(health < 0.01f)
        {
            Destroy(gameObject);
        }
    }
}

