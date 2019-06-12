//
// Created by 李新锐 on 07/07/2018.
//

//HDOJ 1007

#include "alg.h"

#define N 1000010
struct Point
{
    double x;
    double y;
};

Point p[N];
Point strip[N];

inline double dis(Point a, Point b)
{
    return sqrt(pow(a.x - b.x, 2) + pow(a.y - b.y, 2));
}

inline bool cmpx(Point a, Point b)
{
    return a.x < b.x;
}

inline bool cmpy(Point a, Point b)
{
    return a.y < b.y;
}

double mindis(int l, int r)
{
    if(l + 1 == r)
        return dis(p[l], p[r]);
    if(l + 2 == r)
    {
        double a[3] = {dis(p[l], p[l+1]),dis(p[l+1], p[r]),dis(p[1], p[r])};
        return *min_element(a, a+3);
    }
    int mid = (l + r) / 2;
    int cnt = 0;
    auto ret = min(mindis(l, mid), mindis(mid+1, r));
    for(int i = l; i <= r; i++)
    {
        if(fabs(p[i].x - p[mid].x) < ret)
        {
            strip[cnt++] = p[i];
        }
    }
    sort(strip, strip+cnt, cmpy);
    for(int i = 0; i < cnt; ++i)
    {
        for(int j = i + 1; j < cnt && (strip[j].y - strip[i].y < ret); ++j)
        {
            auto t = dis(strip[i], strip[j]);
            if(t < ret) ret = t;
        }
    }
    return ret;
}
int main()
{
    int n ;
    double dia ;
    while(scanf("%d",&n)==1&&n)
    {
        for(int i=0;i<n;i++)
            scanf("%lf%lf",&p[i].x,&p[i].y);
        sort (p , p + n, cmpx);
        dia = mindis ( 0 , n-1 );
        printf("%.2f\n", dia / 2 );
    }
    return 0;
}