//
// Created by 李新锐 on 05/07/2018.
//

#include "alg.h"
using vec = vector<int>;
void cs(vec& A, vec& B, int k)
{
    vec C(k, 0);
    for(auto i : A)
    {
        C[i]++;
    }
    for(int i = 1; i < k; ++i)
    {
        C[i] = C[i] + C[i-1];
    }
    for(int j = A.size() - 1; j >= 0; --j)
    {
        B[C[A[j]] - 1] = A[j];
        C[A[j]]--;
    }
}
#include "gtest/gtest.h"
TEST(ms, t2)
{
    for(int i = 10; i < 1000; ++i)
    {
        auto v = randv(i, 10 * i);
        auto v1 = v;
        auto v2 = v;
        auto v3 = v;
        std::sort(v1.begin(), v1.end());
        cs(v2, v3, i * 10);
        EXPECT_EQ(v1, v3);
    }
}
int main(int argc, char *argv[])
{
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}

