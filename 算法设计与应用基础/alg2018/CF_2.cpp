//
// Created by 李新锐 on 10/07/2018.
//

#include <algorithm>
#include <vector>
#include <iostream>
#include <cstring>
#include <cstdio>
#include <stack>
#include <map>
#include <set>

#define N (int)1E5
bool pat[N];
//int V[4*N];
bool visited[N];
int cc[N];
using namespace std;
inline
//bool P(int n)
//{
//    for(int i = 0; i < n; ++i)
//        if(!pat[i])
//            return false;
//    return true;
//}
//void backtracking(const vector<vector<int>>& g, int n)
//{
//    int k = 0;
//    if(P(n))
//    {
//        cout << "0" << endl;
//        return;
//    }
//    for(int i = 0; i < n; ++i)
//    {
//        memset(visited, 0, sizeof(bool)*N);
//        V[k++] = i;
//        pat[i] = !pat[i];
//        if(P(n))
//        {
//            cout << "1" << endl;
//            cout << i + 1 << endl;
//            return;
//        }
//        stack<int> cst;
//        auto b = V[k-1];
//        int ii = 0;
//        cst.push(ii);
//        while(!cst.empty())
//        {
//            bool v_empty = false;
//            while(ii >= g[b].size() || k == 4*n)
//            {
//                k--;
//                auto xxx = V[k];
//                pat[xxx] = !pat[xxx];
//                if(k == 0)
//                {
//                    v_empty = true;
//                    break;
//                }
//                b = V[k-1];
//                ii = cst.top();
//                ii++;
//                cst.pop();
//            }
//            if(v_empty)
//                break;
//            auto xxx = g[b][ii];
//            if(visited[xxx])
//            {
//                ii++;
//                continue;
//            }
//            else
//            {
//                V[k++] = xxx;
//                pat[xxx] = !pat[xxx];
//                visited[xxx] = true;
//            }
//            if(P(n))
//            {
//                cout << k << endl;
//                for(int i = 0; i < k; ++i)
//                    cout << V[i] + 1 << ' ';
//                cout << endl;
//                return;
//            }
//            else
//            {
//                cst.push(ii);
//                b = V[k-1];
//                ii = 0;
//            }
//        }
//    }
//}

void explore(const vector<vector<int>>& g, int i, int c)
{
    visited[i] = true;
    cc[i] = c;
    for(auto v : g[i])
        if(!visited[v])
            explore(g, v, c);
}
void dfs(const vector<vector<int>>& g)
{
    int c = 0;
    for(int i = 0; i < g.size(); ++i)
    {
        if(!visited[i])
        {
            explore(g, i, c++);
        }
    }
}

vector<int> path;
void vis(const vector<vector<int>>& g, int s, int pre)
{
    visited[s] = true;
    path.push_back(s);
    pat[s] = !pat[s];
    for(auto v : g[s])
    {
        if(!visited[v])
        {
            vis(g, v, s);
            path.push_back(s);
            pat[s] = !pat[s];
        }
    }
    if(!pat[s] && pre != -1)
    {
        path.push_back(pre);
        path.push_back(s);
        pat[pre] = !pat[pre];
        pat[s] = !pat[s];
    }
}
int main()
{
    int n, m;
    cin >> n >> m;
    vector<vector<int>> g(n);
    int u, v;
    while(m--)
    {
        scanf("%d %d", &u, &v);
        g[u-1].push_back(v-1);
        g[v-1].push_back(u-1);
    }
    int _x;
    for(int i = 0; i < n; ++i)
    {
        scanf("%d", &_x);
        pat[i] = !_x;
    }
    for(int i = 0; i < n; ++i)
        cc[i] = -1;
    dfs(g);

    std::set<int> _cnt;
    int s = -1;
    for(int i = 0; i < n; ++i)
    {
        if(!pat[i] && cc[i] >= 0)
        {
            _cnt.insert(cc[i]);
            if(s == -1)
                s = i;
            if(_cnt.size() > 1)
            {
                cout << "-1" << endl;
                return 0;
            }
        }
    }
    if(s == -1)
    {
        cout << 0 << endl;
        return 0;
    }
    memset(visited, 0, sizeof(bool)*N);
    vis(g, s, -1);
    int nn = path.size();
    if(!pat[s])
        nn--;
    cout << nn << endl;
    for(int i = path.size() - nn; i < path.size(); ++i)
        cout << path[i] + 1<< ' ';
    cout << endl;
}

