using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyController : MonoBehaviour
{
    public float speed = 5f; // �������� ������������ �����
    public float attackDistance = 1.5f; // ��������� �����
    public int attackDamage = 10; // ���� �����
    private Transform player; // ������ �� ������
    private bool isAttacking; // ����, �����������, ������� �� ����

    private void Start()
    {
        player = GameObject.FindGameObjectWithTag("Player").transform; // ���� ������ �� ���� "Player"
    }

    private void Update()
    {
        // ������������ ����������� �������� � ������
        Vector3 direction = player.position - transform.position;
        direction.z = 0; // ���������� �������

        // ���� ����� ��������� � ���� �����, �������� ���������
        if (direction.magnitude <= attackDistance)
        {
            isAttacking = true;
        }

        // ���� �� �������, ��������� � ������
        if (!isAttacking)
        {
            transform.position += direction.normalized * speed * Time.deltaTime;
        }
        // ���� �������, ��������������� ����� ������� � �������
        else
        {
            //TODO: �������� ����� ������, ��������: player.TakeDamage(attackDamage);
        }
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
}


