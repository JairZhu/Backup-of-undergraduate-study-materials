//
// Created by 李新锐 on 07/07/2018.
//
#include "alg.h"
int maxProfit(vector<int>& prices) {
    if(prices.empty()) return 0;
    int l, g;
    l = g = 0;
    for(int i = 0; i < prices.size() - 1; ++i)
    {
        l = max(l + prices[i + 1] - prices[i], 0);
        g = max(l, g);
    }
    return g;
}
