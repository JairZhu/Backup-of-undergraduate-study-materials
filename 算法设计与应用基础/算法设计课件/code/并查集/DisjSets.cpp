// DisjSets class
//
// CONSTRUCTION: with int representing initial number of sets
//
// ******************PUBLIC OPERATIONS*********************
// void union( root1, root2 ) --> Merge two sets
// int find( x )              --> Return set containing x
// ******************ERRORS********************************
// No error checking is performed

#include <vector>
#include <iostream>
#include <cstdlib>
using namespace std;

/**
 * Disjoint set class.
 * Use union by rank and path compression.
 * Elements in the set are numbered starting at 0.
 */
class DisjSets
{
  public:
    explicit DisjSets( int numElements );

    int find( int x ) const;
    int find( int x );
    void unionSets( int root1, int root2 );

    vector<int> s;
};

/**
 * Construct the disjoint sets object.
 * numElements is the initial number of disjoint sets.
 */
DisjSets::DisjSets( int numElements ) : s( numElements )
{
    for( int i = 0; i < s.size( ); i++ )
        s[ i ] = -1;
}

/**
 * Union two disjoint sets.
 * For simplicity, we assume root1 and root2 are distinct
 * and represent set names.
 * root1 is the root of set 1.
 * root2 is the root of set 2.
 */
void DisjSets::unionSets( int x1, int x2 )
{
    int root1 = find(x1);
    int root2 = find(x2);
    if( s[ root2 ] < s[ root1 ] )  // root2 is deeper
        s[ root1 ] = root2;        // Make root2 new root
    else
    {
        if( s[ root1 ] == s[ root2 ] )
            s[ root1 ]--;          // Update height if same
        s[ root2 ] = root1;        // Make root1 new root
    }
}


/**
 * Perform a find.
 * Error checks omitted again for simplicity.
 * Return the set containing x.
 */
/* 
int DisjSets::find( int x ) const
{
    if( s[ x ] < 0 )
        return x;
    else
        return find( s[ x ] );
}
*/

/**
 * Perform a find with path compression.
 * Error checks omitted again for simplicity.
 * Return the set containing x.
 */
int DisjSets::find( int x )
{
    if( s[ x ] < 0 )
        return x;
    else
        return s[ x ] = find( s[ x ] );
}


/*
客户端调用例子 
*/
void print(DisjSets &a)
{
  for (int i=0; i<a.s.size(); i++)
    cout << a.s[i] << " ";
  cout << endl;
}
int main()
{
  DisjSets  a(6);
  print(a);
  cout << (a.find(2)==a.find(3)) << endl; //2和3在同一个集合吗？ 

  a.unionSets(2,3); //合并元素2，3所在集合 
  print(a);
  cout << (a.find(2)==a.find(3)) << endl; //2和3在同一个集合吗？ 
  
  a.unionSets(4,5); //合并元素4，5所在集合
  print(a);
  
  a.unionSets(2,5); //合并元素2，5所在集合
  print(a);
  
  a.unionSets(1,5); //合并元素1，5所在集合
  print(a);
  
  system("pause");
  return 0;

}
