//
// Created by 李新锐 on 10/07/2018.
//

#include "alg.h"
int W[1000];
int X[1000];
int M;

void subofsub_worker(int s, int k, int r)
{
    X[k] = 1;
    if(s + W[k] == M)
    {
        for(int i = 0; i <= k; ++i)
            if(X[i]) cout << W[i] << ' ';
        cout << endl;
    }
    else if(s + W[k] + W[k+1] <= M)
    {
        subofsub_worker(s+W[k], k+1, r-W[k]);
    }
    if(s+r-W[k] >= M && s+W[k+1] <= M)
    {
        X[k] = 0;
        subofsub_worker(s, k+1, r-W[k]);
    }
}
void sumofsub(int n)
{
    sort(W, W+n);
    auto sum = accumulate(W, W+n, 0);
    subofsub_worker(0, 0, sum);
}

int main()
{
    int WW[] = {11, 13, 24, 7};
    M = 31;
    memcpy(W, WW, 4*sizeof(int));
    sumofsub(4);
}