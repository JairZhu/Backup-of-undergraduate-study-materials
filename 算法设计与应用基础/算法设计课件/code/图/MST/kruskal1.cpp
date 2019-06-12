// sicily Problem#: 1090 Highway
// The source code is licensed under Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License
// URI: http://creativecommons.org/licenses/by-nc-sa/3.0/
// All Copyright reserved by Informatic Lab of Sun Yat-sen University
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

class edge
{
public:
    int u, v, w;
    edge(int u, int v, int w)
    {
        this->u = u;
        this->v = v;
        this->w = w;
    }
};

bool operator<(const edge& a, const edge& b)
{
    return a.w < b.w;
}

const int N = 500;

int n;
vector<edge> e;

int p[N], r[N];

int root(int x)
{
    if (p[x] == x) return x;
    
    return p[x] = root(p[x]);
}

void merge(int x, int y)
{
    x = root(x);
    y = root(y);
    
    if (r[x] < r[y])
    {
        p[x] = y;
    }
    else if (r[x] > r[y])
    {
        p[y] = x;
    }
    else
    {
        p[y] = x;
        r[x]++;
    }
}

int main()
{
    int T;  scanf("%d", &T);
    for (int c=0; c<T; c++)
    {
        //clear
        e.clear();
        
        //input
        scanf("%d", &n);
        for (int u=0; u<n; u++)
        for (int v=0; v<n; v++)
        {
            int w;
            scanf("%d", &w);
            if (u < v) e.push_back(edge(u, v, w));
        }
        
        //sort edges        
        sort(e.begin(), e.end());
        
        //init forest
        for (int x=0; x<n; x++)
        {
            p[x] = x;
            r[x] = 0;
        }
        
        //kruskal
        int wmax = 0;
        int k = 0;
        for (int i=0; k<n-1 && i<e.size(); i++)
        {
            int u = e[i].u;
            int v = e[i].v;
            int w = e[i].w;
            if (root(u) != root(v))
            {
                merge(u, v);
                k++;
                wmax = w;
            }
        }
        
        //output
        if (c) printf("\n");
        printf("%d\n", wmax);
    }

    return 0;   
}
                                 
