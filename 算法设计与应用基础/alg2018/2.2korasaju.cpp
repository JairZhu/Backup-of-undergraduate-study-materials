//
// Created by 李新锐 on 07/07/2018.
//

#include "alg.h"

using graph_t = vector<vector<int>>;
vector<int> post;
set<int> visited;
map<int, int> topo;
//由于传进来的是逆图
//源点被记录的post值是在最前面的
//即最小的
void dfs(const graph_t& rg, int i)
{
    visited.insert(i);
    for(auto v : rg[i])
        if(!visited.count(v)) dfs(rg, v);
    post.push_back(i);
}

void dfs2(const graph_t& g, int i, int idx)
{
    visited.insert(i);
    topo[i] = idx;
    for(auto v: g[i])
        if(!visited.count(v)) dfs2(g, v, idx);
}

int main()
{
    graph_t g(12), rg(12);
    g[0] = {1};
    g[1] = {2,4};
    g[2] = {5};
    g[3] = {};
    g[4] = {1,5,6};
    g[5] = {2,7};
    g[6] = {7,9};
    g[7] = {10};
    g[8] = {6};
    g[9] = {8};
    g[10] = {11};
    g[11] = {9};
    for(int i = 0; i < g.size(); ++i)
    {
        for(auto j : g[i])
        {
            rg[j].push_back(i);
        }
    }
    for(int i = 0; i < g.size(); ++i)
    {
        if(!visited.count(i)) dfs(rg, i);
    }
    visited.clear();
    for(auto i : post)
        cout << i << ' ';
    cout << endl;
    int k = 0;
    //从属于汇点分量的点开始遍历（实际post最小，在逆post中最靠后）
    for(int i = post.size() - 1; i >= 0; --i)
        if(!visited.count(post[i]))
        {
            cout << "k = " << k << endl;
            for(auto i : visited)
                cout << i << ' ';
            cout << endl;
            cout << post[i] << endl;
            //之所以不会遍历到其他连通分量
            //是因为其他连通分量只要进来的边
            //每次dfs2开始的节点
            //都是post值最低的
            dfs2(g, post[i], k++);
        }
    print("{} components\n", k);
    for(int j = 0; j < k; ++j)
    {
        print("Component {}: ", j);
        for(auto p : topo)
        {
            if(p.second == j)
                print("{}, ",p.first);
        }
        print("\n");
    }
}

/*
void dfs(const graph_t& rg, int i)
{
  visited.insert(i);
  for(auto v:rg[i])
    if(!visited.count(v)) dfs(rg, v);
  post.push_back(i);
}
void dfs2(const graph_t& g, int i , int idx)
{
  visited.insert(i);
  topo[i] = idx;
  for(auto v:g[i])
    if(!visited.count(v)) dfs2(g, v, idx);
}
for(int i = 0; i < rg.size(); ++i)
{
  if(!visited.count(i)) dfs(rg, i);
}
visited.clear();
int k = 0;
for(int i = post.size() - 1; i >= 0; --i)
{
  if(!visited.count(post[i]))
  {
    dfs2(g, post[i], k++);
  }
}

 */
