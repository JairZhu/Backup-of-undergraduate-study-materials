#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;
int threeSumClosest(vector<int>& nums, int target) {
        sort(nums.begin(), nums.end());
        int sim = 999999999;
        int result = 0;
        for (int i = 1; i < nums.size() - 1; i++)
        {
            int temp = 0;
            int front = 0;
            int rear = nums.size() - 1;
            while (i > front && i < rear)
            {
                temp = nums[front] + nums[i] + nums[rear];
                if (temp == target) return target;
                if(abs(temp - target) < sim) 
                {
                    sim = abs(temp - target);
                    result = temp;
                }
                (temp < target) ? (front++) : (rear--);
            }
        }
        return result;
    }
int main()
{
    std::vector<int> v;
    int N;
    cin >> N;
    int temp;
    for (int i = 0; i < N; ++i)
    {
        cin >> temp;
        v.push_back(temp);
    }
    int target;
    cin >> target;
    cout << threeSumClosest(v, target);
    return 0;
}