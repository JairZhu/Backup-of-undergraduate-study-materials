#include <iostream>
#include <unordered_map>
using namespace std;

int main()
{
 int a[10];
 int target;
 unordered_map<int, int> hash;
 for (int i = 0; i < 10; i++)
 {
  cin >> a[i];
 }
 cin >> target;
 for (int i = 0; i < 10; i++)
 {
  int number_to_find = target - a[i];
  if (hash.find(number_to_find) != hash.end())
  {
   cout << hash[number_to_find]  << " " << i;
  }
  hash[a[i]] = i;
 }
 return 0;
}