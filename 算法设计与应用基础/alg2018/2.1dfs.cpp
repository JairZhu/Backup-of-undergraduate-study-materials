//
// Created by 李新锐 on 07/07/2018.
//

#include "alg.h"
using graph_t = vector<vector<int>>;
deque<bool> visited;
vector<int> pre;
vector<int> post;
int clk = 0;
void previsit(int v)
{
    pre[v] = clk;
    clk++;
}
void postvisit(int v)
{
    cout << v << ", ";
    post[v] = clk;
    clk++;
}
void explore_worker(const graph_t& g, int v)
{
    visited[v] = true;
    previsit(v);
    for(auto i: g[v])
        if(!visited[i])
            explore_worker(g, i);
    postvisit(v);
}

//void explore(const graph_t& g, int v)
//{
//    visited.resize(g.size());
//    for(auto& i : visited)
//        i = false;
//    explore_worker(g, v);
//}

void dfs(const graph_t& g)
{
    visited.resize(g.size());
    pre.resize(g.size());
    post.resize(g.size());
    for(auto& i: visited)
        i = false;
    for(int i = 0; i < g.size(); ++i)
        if(!visited[i])
        {
            explore_worker(g, i);
            cout << endl;
        }
}

#include "gtest/gtest.h"
TEST(explore, 1)
{
    graph_t g(10);
    g[0] = {1, 3};
    g[1] = {4, 5};
    g[2] = {};
    g[3] = {6};
    g[4] = {8};
    g[5] = {2};
    g[6] = {7};
    g[7] = {};
    g[8] = {9};
    g[9] = {};
//    explore(g, 0);
//    cout << endl;
    dfs(g);
    cout << endl;
    for(int i = 0; i < 10; ++i)
    {
        print("{}: [{}, {}]\n", i, pre[i], post[i]);
    }
}

TEST(explore, 2)
{
    graph_t g(12);
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
//    explore(g, 0);
//    cout << endl;
    dfs(g);
    cout << endl;
    for(int i = 0; i < 12; ++i)
    {
        print("{}: [{}, {}]\n", i, pre[i], post[i]);
    }
}

int main(int argc, char *argv[])
{
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
