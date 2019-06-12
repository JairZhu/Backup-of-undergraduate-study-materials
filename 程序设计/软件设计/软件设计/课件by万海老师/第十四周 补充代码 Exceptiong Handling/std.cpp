#include <iostream> 
#include <exception> 
#include <stdexcept> 
using namespace std; 

int main() 
{ 
    int a[10]; 
    int temp; 
    try 
    { 
      throw out_of_range( "a "); 
    } 
    catch (out_of_range & exc) 
    { 
      cout << exc.what() <<endl; 
    } 
    
    cout << "Done! " <<endl; 
    system("PAUSE");
    return 0; 
} 
