//
// Created by 李新锐 on 08/07/2018.
//
#include "alg.h"

int lengthOfLIS(vector<int>& nums) {
    if(nums.empty()) return 0;
    vector<int> prev(nums.size(), -1);
    vector<int> L(nums.size(), 1);
    for(int j = 0; j < nums.size(); ++j)
    {
        for(int i = 0; i < j; ++i)
        {
            if(nums[i] < nums[j])
            {
                if(1 + L[i] > L[j])
                {
                    L[j] = 1 + L[i];
                    prev[j] = i;
                }
            }
        }
    }
    auto ret = max_element(L.begin(), L.end());
    int t = ret - L.begin();
    vector<int> path;
    for(; t != -1; t = prev[t])
        path.push_back(t);
    reverse(path.begin(), path.end());
    for(auto i : path)
    {
        cout << nums[i] << ", ";
    }
    cout << endl;
    return *ret;
}

#include "gtest/gtest.h"
TEST(LIS, 1)
{
    vector<int> s{5,2,8,6,3,6,9,7};
    cout << lengthOfLIS(s) << endl;
}
int main(int argc, char *argv[])
{
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}

