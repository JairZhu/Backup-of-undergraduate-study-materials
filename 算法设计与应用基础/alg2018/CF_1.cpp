#include <iostream>
#include <algorithm>
#include <cmath>
using namespace std;
inline
uint16_t sel_cnt(uint16_t sel)
{
    int cnt = 0;
    for(uint32_t i = 1; i < (1 << 15); i = i << 1)
    {
        if(sel & i)
            cnt++;
    }
    return cnt;
}
int main()
{
    int n, l, r, x;
    cin >> n >> l >> r >> x;
    int c[n];
    for(int i = 0; i < n; ++i)
        cin >> c[i];
    sort(c, c+n);
    int ret = 0;
    for(uint16_t sel = 0; sel < pow(2, n); ++sel)
    {
        if(sel_cnt(sel) < 2)
            continue;
        int sum = 0;
        int min = -1;
        int max = -1;
        for(uint32_t i = 1, bit = 0; i < (1 << 15); i = i << 1, bit += 1)
        {
            if(sel & i)
            {
                sum += c[bit];
                if(min == -1)
                    min = c[bit];
                max = c[bit];
            }
        }
        if(sum > r || sum < l)
            continue;
        if(max - min < x)
            continue;
        ret++;
    }
    cout << ret << endl;
    return 0;
}
