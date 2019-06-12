//
// Created by 李新锐 on 08/07/2018.
//
#include "alg.h"

struct edge_t {
    int from;
    int to;
    int w;
    bool operator<(const edge_t& rhs) const
    {
        if(from == rhs.from)
        {
            return to < rhs.to;
        }
        return from < rhs.from;
    }
};

using graph_t = vector<vector<edge_t>>;
map<int, int> fa;
void makeset(int n)
{
    for(int i = 0; i < n; ++i)
        fa[i] = i;
}
int find(int x)
{
    return (x == fa[x]) ? x : (fa[x] = find(fa[x]));
}
void unite(int x, int y)
{
    x = find(x);
    y = find(y);
    if(x != y)
        fa[x] = y;
}
int kruskal(const graph_t& g)
{
    int n = g.size();
    makeset(n);

    //排序边
    vector<edge_t> X;
    set<edge_t> E;
    for(auto v:g)
        for(auto e:v)
            if(e.from < e.to)
                E.insert(e);
    vector<edge_t> sE(E.begin(), E.end());
    sort(sE.begin(), sE.end(), [](auto lhs, auto rhs){
        return lhs.w < rhs.w;
    });

    //算法
    for(auto e : sE)
    {
        if(find(e.from) != find(e.to))
            X.push_back(e);
        unite(e.from, e.to);
    }
    for(auto e:X)
    {
        print("{}->{}:{}\n", e.from, e.to, e.w);
    }
    return 0;
}

int main()
{
    graph_t g(6);
    g[0] = {{0,1,2},{0,2,1}};
    g[1] = {{1,0,2},{1,2,2},{1,3,1}};
    g[2] = {{2,0,1},{2,1,2},{2,3,2}};
    g[3] = {{3,1,1},{3,2,2},{3,4,3},{3,5,4}};
    g[4] = {{4,2,3},{4,3,3},{4,5,1}};
    g[5] = {{5,3,4},{5,4,1}};
    kruskal(g);
}
