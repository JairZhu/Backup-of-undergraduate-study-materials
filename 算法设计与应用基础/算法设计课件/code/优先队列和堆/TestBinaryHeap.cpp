#include <iostream>
#include "BinaryHeap.h"
using namespace std;

    // Test program
int main( )
{
    int numItems = 99999;
    BinaryHeap<int> h;
    int i = 37;
    int x;

    cout << "Begin test... " << endl;

    for( i = 37; i != 0; i = ( i + 37 ) % numItems )
        h.insert( i );
    for( i = 1; i < numItems; i++ )
    {
        h.deleteMin( x );
        if( x != i )
            cout << "Oops! " << i << endl;
    }
    for( i = 37; i != 0; i = ( i + 37 ) % numItems )
        h.insert( i );
    h.insert( 0 );

    cout << "End test... no other output is good" << endl;
    return 0;
}
