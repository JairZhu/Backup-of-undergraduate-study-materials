//
// Created by 李新锐 on 10/07/2018.
//
#include <cstdio>
#include <cfloat>
#include <algorithm>
#include <cmath>
#include <iostream>

using namespace std;
int n, p, q;
int a[100000];
int b[100000];
double f(double x)
{
    double y = DBL_MAX;
    for (int i = 0; i < n; i++)
    {
        y = min(y, (1.0 - a[i] * x)/(double)b[i]);
    }
    return p * x + q * y;

}
int main()
{
    scanf("%d %d %d", &n, &p, &q);
    int ma = 0;
    for(int i = 0; i < n; ++i)
    {
        scanf("%d %d", a + i, b + i);
        ma = a[i] > ma ? a[i] : ma;
    }
    double l, r, lmid, rmid;
    l = 0;
    r = 1.0 / ma;
    double eps = 1E-9;
    for(int i = 0; i < 50; ++i)
    {
        lmid = l + (r-l) / 3;
        rmid = lmid + (r-l)/3;
        if(f(lmid) > f(rmid))
            r = rmid;
        else
            l = lmid;
    }
    printf("%f", f(l));
}