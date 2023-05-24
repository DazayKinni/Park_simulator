using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class EnemyController : MonoBehaviour
{
    public float speed = 5f; // �������� ������������ �����
    public float attackDistance = 1.5f; // ��������� �����
    public int attackDamage = 10; // ���� �����
    private Transform player; // ������ �� ������
    private bool isAttacking; // ����, �����������, ������� �� ����
    private NavMeshAgent agent;
    private Trees[] trees;

    private void Start()
    {
        player = GameObject.FindGameObjectWithTag("Player").transform; // ���� ������ �� ���� "Player"
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
        // ���� ���� ���������� � �������, �������� ���������
        if (other.CompareTag("Player"))
        {
            isAttacking = true;
        }
    }

    private void OnTriggerExit2D(Collider2D other)
    {
        // ���� ����� ����� �� ���� �����, ���������� �����
        if (other.CompareTag("Player"))
        {
            isAttacking = false;
        }
    }
    private void Move()
    {
        agent.SetDestination(player.position);
    }
}


