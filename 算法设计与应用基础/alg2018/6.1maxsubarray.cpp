//
// Created by 李新锐 on 07/07/2018.
//
#include "alg.h"

int maxSubarrary(vector<int>& A)
{
    if(A.empty()) return 0;
    int l, g;
    l = g = A[0];
    for(int i = 1; i < A.size(); ++i)
    {
        l = l > 0 ? (l + A[i]) : A[i];
        g = max(l, g);
    }
    return g;
}