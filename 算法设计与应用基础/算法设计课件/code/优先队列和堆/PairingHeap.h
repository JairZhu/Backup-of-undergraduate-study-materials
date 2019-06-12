#ifndef PAIRING_HEAP_H
#define PAIRING_HEAP_H
#include "dsexceptions.h"
#include <iostream>        // For NULL
using namespace std;

// Pairing heap class
//
// CONSTRUCTION: with no parameters
//
// ******************PUBLIC OPERATIONS*********************
// PairNode & insert( x ) --> Insert x
// deleteMin( minItem )   --> Remove (and optionally return) smallest item
// Comparable findMin( )  --> Return smallest item
// bool isEmpty( )        --> Return true if empty; else false
// void makeEmpty( )      --> Remove all items
// void decreaseKey( Position p, newVal )
//                        --> Decrease value in Position p
// ******************ERRORS********************************
// Throws UnderflowException as warranted

template <typename Comparable>
class PairingHeap
{
  public:
    PairingHeap( )
    {
        root = NULL;
    }

    PairingHeap( const PairingHeap & rhs )
    {
        root = NULL;
        *this = rhs;
    }

    ~PairingHeap( )
    {
        makeEmpty( );
    }

    bool isEmpty( ) const
    {
        return root == NULL;
    }

    const Comparable & findMin( ) const
    {
        if( isEmpty( ) )
            throw UnderflowException( );
        return root->element;
    }

    struct PairNode;
    typedef PairNode * Position;

    /**
     * Insert item x into the priority queue, maintaining heap order.
     * Return the Position  (a pointer to the node) containing the new item.
     */
    Position insert( const Comparable & x )
    {
        PairNode *newNode = new PairNode( x );

        if( root == NULL )
            root = newNode;
        else
            compareAndLink( root, newNode );
        return newNode;
    }

    /**
     * Remove the smallest item from the priority queue
     * or throw UnderflowException if empty.
     */
    void deleteMin( )
    {
        if( isEmpty( ) )
            throw UnderflowException( );

        PairNode *oldRoot = root;

        if( root->leftChild == NULL )
            root = NULL;
        else
            root = combineSiblings( root->leftChild );

        delete oldRoot;
    }

    /**
     * Remove the smallest item from the priority queue.
     * Pass back the smallest item via minItem, or throw UnderflowException if empty.
     */
    void deleteMin( Comparable & minItem )
    {
        minItem = findMin( );
        deleteMin( );
    }

    void makeEmpty( )
    {
        reclaimMemory( root );
        root = NULL;
    }

    /**
     * Change the value of the item stored in the pairing heap.
     * Throw IllegalArgumentException if newVal is larger than
     *    currently stored value.
     * p is a Position returned by insert.
     * newVal is the new value, which must be smaller
     *    than the currently stored value.
     */
    void decreaseKey( Position p, const Comparable & newVal )
    {
        if( p->element < newVal )
            throw IllegalArgumentException( );    // newVal cannot be bigger
        p->element = newVal;
        if( p != root )
        {
            if( p->nextSibling != NULL )
                p->nextSibling->prev = p->prev;
            if( p->prev->leftChild == p )
                p->prev->leftChild = p->nextSibling;
            else
                p->prev->nextSibling = p->nextSibling;

            p->nextSibling = NULL;
            compareAndLink( root, p );
        }
    }

    const PairingHeap & operator=( const PairingHeap & rhs )
    {
        if( this != &rhs )
        {
            makeEmpty( );
            root = clone( rhs.root );
        }

        return *this;
    }

  private:
    struct PairNode
    {
        Comparable   element;
        PairNode    *leftChild;
        PairNode    *nextSibling;
        PairNode    *prev;

        PairNode( const Comparable & theElement ) : element( theElement ),
            leftChild( NULL ), nextSibling( NULL ), prev( NULL ) { }
    };

    PairNode *root;

    /**
     * Internal method to make the tree empty.
     * WARNING: This is prone to running out of stack space.
     */
    void reclaimMemory( PairNode *t )
    {
        if( t != NULL )
        {
            reclaimMemory( t->leftChild );
            reclaimMemory( t->nextSibling );
            delete t;
        }
    }

    /**
     * Internal method that is the basic operation to maintain order.
     * Links first and second together to satisfy heap order.
     * first is root of tree 1, which may not be NULL.
     *    first->nextSibling MUST be NULL on entry.
     * second is root of tree 2, which may be NULL.
     * first becomes the result of the tree merge.
     */
    void compareAndLink( PairNode * & first, PairNode *second )
    {
        if( second == NULL )
            return;

        if( second->element < first->element )
        {
            // Attach first as leftmost child of second
            second->prev = first->prev;
            first->prev = second;
            first->nextSibling = second->leftChild;
            if( first->nextSibling != NULL )
                first->nextSibling->prev = first;
            second->leftChild = first;
            first = second;
        }
        else
        {
            // Attach second as leftmost child of first
            second->prev = first;
            first->nextSibling = second->nextSibling;
            if( first->nextSibling != NULL )
                first->nextSibling->prev = first;
            second->nextSibling = first->leftChild;
            if( second->nextSibling != NULL )
                second->nextSibling->prev = second;
            first->leftChild = second;
        }
    }

    /**
     * Internal method that implements two-pass merging.
     * firstSibling the root of the conglomerate and is assumed not NULL.
     */
    PairNode * combineSiblings( PairNode *firstSibling )
    {
        if( firstSibling->nextSibling == NULL )
            return firstSibling;

            // Allocate the array
        static vector<PairNode *> treeArray( 5 );

            // Store the subtrees in an array
        int numSiblings = 0;
        for( ; firstSibling != NULL; numSiblings++ )
        {
            if( numSiblings == treeArray.size( ) )
                treeArray.resize( numSiblings * 2 );
            treeArray[ numSiblings ] = firstSibling;
            firstSibling->prev->nextSibling = NULL;  // break links
            firstSibling = firstSibling->nextSibling;
        }
        if( numSiblings == treeArray.size( ) )
            treeArray.resize( numSiblings + 1 );
        treeArray[ numSiblings ] = NULL;

            // Combine subtrees two at a time, going left to right
        int i = 0;
        for( ; i + 1 < numSiblings; i += 2 )
            compareAndLink( treeArray[ i ], treeArray[ i + 1 ] );

        int j = i - 2;

            // j has the result of last compareAndLink.
            // If an odd number of trees, get the last one.
        if( j == numSiblings - 3 )
            compareAndLink( treeArray[ j ], treeArray[ j + 2 ] );

            // Now go right to left, merging last tree with
            // next to last. The result becomes the new last.
        for( ; j >= 2; j -= 2 )
            compareAndLink( treeArray[ j - 2 ], treeArray[ j ] );
        return treeArray[ 0 ];
    }

    /**
     * Internal method to clone subtree.
     * WARNING: This is prone to running out of stack space.
     */
    PairNode * clone( PairNode *t )
    {
        if( t == NULL ) 
            return NULL;
        else
        {
            PairNode *p = new PairNode( t->element );
            if( ( p->leftChild = clone( t->leftChild ) ) != NULL )
                p->leftChild->prev = p;
            if( ( p->nextSibling = clone( t->nextSibling ) ) != NULL )
                p->nextSibling->prev = p;
            return p;
        }
    }
};

#endif
