//
// Created by 李新锐 on 07/07/2018.
//

#include "alg.h"

struct edge
{
    int id;
    int w;
};
using graph_t = vector<vector<edge>>;

void dijkstra(const graph_t& g, int start)
{
    int n = g.size();
    //这里dist的长度为n+1，最后有一个永远是INT_MAX的元素
    vector<int> dist(n + 1, INT_MAX);
    dist[start] = 0;

    set<int> R;
    while(R.size() != n)
    {
        //inf
        int u = n;
        for(int i = 0; i < n; ++i)
            if(!R.count(i) && dist[i] < dist[u])
                u = i;
        R.insert(u);
        for(auto e : g[u])
            dist[e.id] = min(dist[e.id], dist[u] + e.w);
    }
}

void bellman_ford(const graph_t& g, int start)
{
    int n = g.size();
    vector<int> dist(n + 1, INT_MAX);
    dist[start] = 0;

    for(int i = 0; i < n - 1; i++)
    {
        for(int u = 0; u < g.size(); ++u)
        {
            for(auto e : g[u])
            {
                dist[e.id] = min(dist[e.id], dist[u] + e.w);
            }
        }
    }
}

vector<int> topo;
void toposort(const graph_t& g)
{
    map<int, int> indegree;
    for(auto v : g)
    {
        for(auto e : v)
        {
            indegree[e.id]++;
        }
    }
    queue<int> q;
    for(auto p : indegree)
        if(p.second == 0)
            q.push(p.first);
    while (!q.empty())
    {
        auto u = q.front();
        q.pop();
        topo.push_back(u);
        for(auto e : g[u])
            if(--indegree[e.id] == 0)
                q.push(e.id);
    }
}

void dag_shortest(const graph_t& g, int start)
{
    int n = g.size();
    vector<int> dist(n + 1, INT_MAX);
    dist[start] = 0;
    toposort(g);
    for(auto u : topo)
    {
        for(auto e : g[u])
            dist[e.id] = min(dist[e.id], dist[u] + e.w);
    }
}