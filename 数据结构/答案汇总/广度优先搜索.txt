#include <iostream>
#include <queue>
#include <vector>
using namespace std;
int main()
{
 int n = 0;
 int s = 0;
 cin >> n;
 cin >> s;
 bool ** adj = new bool * [n];
 for (int i = 0; i < n; i++)
 {
  adj[i] = new bool[n];
  for (int j = 0; j < n; j++)
  {
   cin >> adj[i][j];
  }
 }
 vector<bool> is_visit(n + 1, false);
 vector<int> bfs;
 queue<int> q;
 q.push(s);
 while (q.empty() == false)
 {
  int current_node = q.front();
  q.pop();
  if (is_visit[current_node] == false)
  {
   bfs.push_back(current_node);
   is_visit[current_node] = true;
   for (int i = 0; i < n; i++)
   {
    if (adj[current_node - 1][i] == true && is_visit[i + 1] == false)
     q.push(i + 1);
   }
  }
 }
 cout << bfs[0];
 for (int  i = 1; i < bfs.size(); i++)
 {
  cout << ' ' << bfs[i];
 }
 for (int i = 0; i < n; i++)
 {
  delete [] adj[i];
 }
 delete [] adj;
 return 0;
}