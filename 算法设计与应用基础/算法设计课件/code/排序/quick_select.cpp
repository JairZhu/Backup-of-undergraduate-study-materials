#include <iostream>
#include <vector>
using namespace std;
template <typename Comparable>
int median3( vector<Comparable> & a, int left, int right )
{
    int center = ( left + right ) / 2;
    if( a[ center ] < a[ left ] )
        swap( a[ left ], a[ center ] );
    if( a[ right ] < a[ left ] )
        swap( a[ left ], a[ right ] );
    if( a[ right ] < a[ center ] )
        swap( a[ center ], a[ right ] );

    // Place pivot at position right 
    swap( a[ center ], a[ right ] );
    return right;
}

template <typename Comparable>
int partion(vector<Comparable> & a, int left, int right, int pivotIndex)
{
  Comparable pivotValue = a[pivotIndex];
  int storeIndex = left;
  for (int i=left; i<=right; ++i)
  {
    if (a[i]<pivotValue)
      { swap(a[storeIndex], a[i]); storeIndex++; }
  }
  swap(a[right],a[storeIndex]);  
  return storeIndex;
}

template <typename Comparable>
int quickSelect( vector<Comparable> & a, int left, int right, int k )
{
        if (left == right) return a[left];
        int pivotIndex = median3( a, left, right );
        int pivotNewIndex = partion(a, left, right, pivotIndex);
        int pivotDist = pivotNewIndex-left+1;
        if ( k == pivotDist ) return a[pivotNewIndex]; 
        else if( k < pivotDist )
            return quickSelect( a, left, pivotNewIndex - 1, k );
        else 
            return quickSelect( a, pivotNewIndex + 1, right, k-pivotDist );
}

int main()
{
    vector <int>p;
    int k;
    p.push_back(17);
    p.push_back(3);
    p.push_back(6);
    p.push_back(1);
    p.push_back(8);
    p.push_back(2);
    p.push_back(4);
    p.push_back(5);
    p.push_back(0);
    p.push_back(9);
    for (k=1; k<=p.size(); k++)
      cout << quickSelect(p,0,9,k) << " ";
    cout << endl;
}
