//
// Created by 李新锐 on 05/07/2018.
//

#include "vector"
#include "iostream"
#include "gtest/gtest.h"

using namespace std;

void merge(vector<int>& a, int lo, int mid, int hi)
{
    int i = lo;
    int j = mid + 1;
    auto aux =a ;
    for(int k = lo; k <= hi; ++k)
    {
        if(i > mid) a[k] = aux[j++];
        else if (j > hi) a[k] = aux[i++];
        else if (aux[i] < aux[j]) a[k] = aux[i++];
        else a[k] = aux[j++];
    }
}
void mergesort(vector<int>& a, int lo, int hi)
{
    if(lo >= hi) return;
    int mid = lo + (hi - lo) /2;
    mergesort(a, lo, mid);
    mergesort(a, mid + 1, hi);
    merge(a, lo, mid, hi);
    std::merge(a.begin(), a.begin()+mid + 1, a.begin() + mid + 1, a.begin() + hi + 1, a.begin());
}

TEST(ms, ms)
{
    vector<int> v{4,23,6,34,6,3,6,3,26,3,36,2,63,456};
    auto v1 = v;
    auto v2 = v;
    std::sort(v1.begin(), v1.end());
    mergesort(v2, 0, v2.size() - 1);
    EXPECT_EQ(v1, v2);
}
TEST(ms, t2)
{
    vector<int> v{2, 1};
    auto v1 = v;
    auto v2 = v;
    std::sort(v1.begin(), v1.end());
    mergesort(v2, 0, v2.size() - 1);
    EXPECT_EQ(v1, v2);
}
TEST(ms, t3)
{
    vector<int> v{3435,54645,67,32,4,345623,423,4,235,34,65,45,7,432,4213,4,123,5,43,6,323,4123,13,5,54,76,54,63,123,41,34,6,354,631,2,4312,6,453,7,345,6,34,};
    auto v1 = v;
    auto v2 = v;
    std::sort(v1.begin(), v1.end());
    mergesort(v2, 0, v2.size() - 1);
    EXPECT_EQ(v1, v2);
}
int main(int argc, char *argv[])
{
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}

