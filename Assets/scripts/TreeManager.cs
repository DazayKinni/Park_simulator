using System.Collections;                                  
using System.Collections.Generic;                          
using UnityEngine;                                         
                                                           
public class TreeManager : MonoBehaviour                   
{                                                          
    private List<Tree> trees = new List<Tree>();                              
    // Start is called before the first frame update       
    void Start()                                           
    {
        UpdateTrees();                                         
                                                           
    }                                                      
    void UpdateTrees()                                     
    {
        Tree[] tempTrees = GetComponentsInChildren<Tree>();
        for (int i = 0; i < tempTrees.Length; i++)         
        {                                                  
            trees.Add(tempTrees[i]);                       
        }                                                  
    }                                                      
                                                           
    // Update is called once per frame                     
    void Update()                                          
    {                                                      
                                                           
    }                                                      
                                                           
    public Tree GetNearestTree(Vector3 pos)                
    {
        float minDist = float.MaxValue;
        Tree nearestTree = null;
        int i = 0;
        while(i < trees.Count)
        {
            if (minDist > Vector3.Distance(pos, trees[i].gameObject.transform.position))
            {
                minDist = Vector3.Distance(pos, trees[i].gameObject.transform.position);
                nearestTree = trees[i];
            }

            i++;
        }
        return nearestTree;
    }
}
