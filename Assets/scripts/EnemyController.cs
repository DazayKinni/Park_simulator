using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class EnemyController : MonoBehaviour
{
    public float speed = 5f; // скорость передвижения врага
    public float attackDistance = 1.5f; // дистанция атаки
    public int attackDamage = 10; // урон атаки
    private Transform player; // ссылка на игрока
    private bool isAttacking; // флаг, указывающий, атакует ли враг
    private NavMeshAgent agent;
    private TreeManager treeManager;

    private void Start()
    {
        treeManager = GameObject.FindGameObjectWithTag("Tree Manager").GetComponent<TreeManager>();
        player = GameObject.FindGameObjectWithTag("Player").transform; // ищем игрока по тэгу "Player"
        agent = GetComponent<NavMeshAgent>();
        agent.updateRotation = false;
        agent.updateUpAxis = false;
    }

    private void Update()
    {
        Move();
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
    private void Move()
    {
        Tree nearestTree = treeManager.GetNearestTree(transform.position);
        agent.SetDestination(nearestTree.transform.position);
    }
}


