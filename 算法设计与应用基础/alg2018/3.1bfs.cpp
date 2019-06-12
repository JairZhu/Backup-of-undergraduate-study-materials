//
// Created by 李新锐 on 07/07/2018.
//
#include "alg.h"
using graph_t = vector<vector<int>>;
map<int, int> dist;
void bfs(const graph_t& g, int s)
{
    for(int i = 0; i < g.size(); ++i)
        dist[i] = INT_MAX;
    dist[s] = 0;
    queue<int> Q;
    Q.push(s);
    while (!Q.empty())
    {
        auto u = Q.front();
        Q.pop();
        cout << u << ' ';
        cout << endl;
        for(auto v: g[u])
        {
            if(dist[v] == INT_MAX)
            {
                Q.push(v);
                dist[v] = dist[u] + 1;
            }
        }
    }
}

#include "gtest/gtest.h"

int main(int argc, char *argv[])
{
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}


TEST(bfs, 1)
{
    graph_t g(6);
    g[0] = {1, 2, 3, 4};
    g[1] = {5};
    bfs(g, 0);
    for(int i = 0; i < 6; ++i)
    {
        cout << i << " : " << dist[i] << endl;
    }
}
