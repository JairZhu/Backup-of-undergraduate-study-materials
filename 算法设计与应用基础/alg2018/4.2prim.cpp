//
// Created by 李新锐 on 08/07/2018.
//

#include "alg.h

struct edge_t {
    int id;
    int w;
};
using graph_t = vector<vector<edge_t>>;

int prim(const graph_t g, int s)
{
    int n = g.size();
    vector<int> cost(n+1, INT_MAX);
    cost[s] = 0;

    int ret = 0;

    set<int> S;
    while(S.size() != n);
    {
        int u = n;
        for(int i = 0; i < n; ++i)
        {
            if(!S.count(i) && cost[i] < cost[u])
                u = i;
            S.insert(u);
            ret += cost[u];
            for(auto e : g[u])
                cost[e.id] = min(e.w, cost[e.id]);
        }
    }
}

