//
// Created by 李新锐 on 06/07/2018.
//


#include "alg.h"

int findksmall(vector<int>& nums, int k, int lo, int hi)
{
    int v = nums[hi];
    int i = lo;
    for(int j = lo; j < hi; ++j)
    {
        if(nums[j] <= v)
        {
            swap(nums[i++], nums[j]);
        }
    }
    swap(nums[i], nums[hi]);
    int leV = i - lo;
    int eqV = 0;
    for(int j = i; nums[j] == v && j <= hi; ++j, ++eqV);
    if(k <= leV)
        return findksmall(nums, k, lo, lo + leV - 1);
    else if(k > leV + eqV)
        return findksmall(nums, k-leV-eqV, lo + leV + eqV, hi);
    else return v;
}

int selection(vector<int> &nums, int k, int lo, int hi) {
    int v = nums[hi];
    int i = lo - 1;
    for (int j = lo; j < hi; ++j) {
        if (nums[j] <= v) {
            ++i;
            swap(nums[i], nums[j]);
        }

    }
    swap(nums[i + 1], nums[hi]);
    int LSL = i - lo + 1;
    int LSV = 0;
    for (int j = i + 1; nums[j] == v && j <= hi; ++j, ++LSV);
    if (k <= LSL) return selection(nums, k, lo, lo + LSL - 1);
    else if (k > LSL + LSV)
        return selection(nums, k - LSL - LSV, lo + LSL + LSV, hi);
    else return v;

}

int findKthLargest(vector<int> &nums, int k) {
    for (auto &i : nums) i = -i;
    return -selection(nums, k, 0, nums.size() - 1);
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
//        for(auto i : v1) cout << i << ' ';
//        cout << endl;
        srand(time(0));
        auto k = rand() % i;
//        cout << k << endl;
        auto ret = findksmall(v2, k + 1, 0, v2.size() - 1);
//        auto ret = findKthLargest(v, k + 1);
        EXPECT_EQ(v1[k], ret);
    }
}
int main(int argc, char *argv[])
{
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}

