#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;

/* Return median of left, center, and right.
 * Order these and hide the pivot.*/
template <typename Comparable>
const Comparable & median3( vector<Comparable> & a, int left, int right )
{
    int center = ( left + right ) / 2;
    if( a[ center ] < a[ left ] )
        swap( a[ left ], a[ center ] );
    if( a[ right ] < a[ left ] )
        swap( a[ left ], a[ right ] );
    if( a[ right ] < a[ center ] )
        swap( a[ center ], a[ right ] );

        // Place pivot at position right - 1
    swap( a[ center ], a[ right - 1 ] );
    return a[ right - 1 ];
}

template <typename Comparable>
void quicksort( vector<Comparable> & a, int left, int right )
{
    if( left + 10 <= right )
    {
        Comparable pivot = median3( a, left, right );

            // Begin partitioning
        int i = left, j = right - 1;
        for( ; ; )
        {
            while( a[ ++i ] < pivot ) { }
            while( pivot < a[ --j ] ) { }
            if( i < j )
                swap( a[ i ], a[ j ] );
            else
                break;
        }

        swap( a[ i ], a[ right - 1 ] );  // Restore pivot

        quicksort( a, left, i - 1 );     // Sort small elements
        quicksort( a, i + 1, right );    // Sort large elements
    }
    else  // Do an insertion sort on the subarray
        sort( a.begin()+left, a.begin()+right+1 );
}

/**
 * Quicksort algorithm (driver).
 */
template <typename Comparable>
void quicksort( vector<Comparable> & a )
{
    quicksort( a, 0, a.size( ) - 1 );
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
    quicksort(p, 0, p.size()-1);
    for (k=0; k<p.size(); k++)
      cout << p[k] << " ";
    cout << endl;
}
