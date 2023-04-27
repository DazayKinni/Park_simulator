using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyController : MonoBehaviour
{
    public float speed = 5f; // скорость передвижения врага
    public float attackDistance = 1.5f; // дистанция атаки
    public int attackDamage = 10; // урон атаки
    private Transform player; // ссылка на игрока
    private bool isAttacking; // флаг, указывающий, атакует ли враг

    private void Start()
    {
        player = GameObject.FindGameObjectWithTag("Player").transform; // ищем игрока по тэгу "Player"
    }

    private void Update()
    {
        // рассчитываем направление движения к игроку
        Vector3 direction = player.position - transform.position;
        direction.z = 0; // игнорируем глубину

        // если игрок находится в зоне атаки, начинаем атаковать
        if (direction.magnitude <= attackDistance)
        {
            isAttacking = true;
        }

        // если не атакуем, двигаемся к игроку
        if (!isAttacking)
        {
            transform.position += direction.normalized * speed * Time.deltaTime;
        }
        // если атакуем, останавливаемся перед игроком и атакуем
        else
        {
            //TODO: добавить атаку игрока, например: player.TakeDamage(attackDamage);
        }
    }

    private void OnTriggerEnter2D(Collider2D other)
    {
        // если враг столкнулся с игроком, начинаем атаковать
        if (other.CompareTag("Player"))
        {
            isAttacking = true;
        }
    }

    private void OnTriggerExit2D(Collider2D other)
    {
        // если игрок вышел из зоны атаки, прекращаем атаку
        if (other.CompareTag("Player"))
        {
            isAttacking = false;
        }
    }
}


