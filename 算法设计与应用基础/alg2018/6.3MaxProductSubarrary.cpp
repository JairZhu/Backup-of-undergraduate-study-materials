//
// Created by 李新锐 on 07/07/2018.
//

#include "alg.h"
int maxProduct(vector<int>& A)
{
    if(A.empty())       return 0;
    if(A.size() == 1)   return A[0];
    int maxl, minl, g;
    maxl = minl = g = A[0];
    for(int i = 1; i < A.size(); ++i)
    {
        int t = maxl;
        //A[i] * maxl, A[i], A[i] * minl 三者中挑出最大和最小
        maxl = max(max(A[i] * maxl, A[i]), A[i] * minl);
        minl = min(min(A[i] * t, A[i]), A[i] * minl);
        g = max(g, maxl);
    }
    return g;
}
