//
// Created by 李新锐 on 08/07/2018.
//

#include "alg.h"
struct Node
{
    int v;
    Node* l;
    Node* r;
    explicit Node(int _v, Node* _l = nullptr, Node* _r = nullptr)
            : v(_v), l(_l), r(_r){}
};

auto gt = [](const Node* lhs, const Node* rhs)
{
    return lhs->v > rhs ->v;
};

Node* huffman(const vector<int>& f)
{
    auto H = priority_queue<Node*, std::vector<Node*>, decltype(gt)>(gt);
    for(auto v : f)
    {
        H.push(new Node{v, nullptr, nullptr});
    }
    while(H.size() > 1)
    {
        auto n1 = H.top();
        H.pop();
        auto n2 = H.top();
        H.pop();
        auto n = new Node{n1->v+n2->v, n1, n2};
        H.push(n);
    }
    return H.top();
}

#include "gtest/gtest.h"

TEST(huffman, 1)
{
    vector<int> f{70, 3, 20, 37};
    auto ret = huffman(f);
}

int main(int argc, char *argv[])
{
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}

