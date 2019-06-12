//
// Created by 李新锐 on 05/07/2018.
//

#include "alg.h"

int partition(vector<int>& v, int lo, int hi)
{
    auto p = v[hi];
    int i = lo;
    for(int j = lo; j < hi; ++j)
    {
        if(v[j] < p)
        {
            swap(v[j], v[i++]);
        }
    }
    swap(v[i], v[hi]);
    return i;
}

void qsort(vector<int>& v, int lo, int hi)
{
    if(lo < hi)
    {
        auto q = partition(v, lo, hi);
        qsort(v, lo, q - 1);
        qsort(v, q + 1, hi);
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
        std::sort(v1.begin(), v1.end());
        qsort(v2, 0, v2.size() - 1);
        EXPECT_EQ(v1, v2);
    }
}
int main(int argc, char *argv[])
{
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}

