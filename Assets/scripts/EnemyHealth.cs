using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyHealth : MonoBehaviour
{
    [SerializeField] float health = 50;

    public void GetDamage(float damage)
    {
        health -= damage;
        if(health < 0.01f)
        {
            Destroy(gameObject);
        }
    }
}

