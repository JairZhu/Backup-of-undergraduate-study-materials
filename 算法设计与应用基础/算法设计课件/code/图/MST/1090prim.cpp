// sicily Problem#: 1090 Highway
// The source code is licensed under Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License
// URI: http://creativecommons.org/licenses/by-nc-sa/3.0/
// All Copyright reserved by Informatic Lab of Sun Yat-sen University
#include <iostream>
#include <queue>
using namespace std;

const int N = 500;

int n;
int d[N][N];

class edge
{
public:
    int u, v;
    edge(int u, int v)
    {
        this->u = u;
        this->v = v;
    }
};

bool operator<(const edge& a, const edge& b)
{
    return d[a.u][a.v] > d[b.u][b.v];
}

bool t[N];
priority_queue<edge> q;

void take(int u)
{
    t[u] = 1;
    for (int v=0; v<n; v++)
    {
        if (!t[v]) q.push(edge(u, v));
    }
}

int main()
{
    int T;  scanf("%d", &T);
    for (int c=0; c<T; c++)
    {
        //input
        scanf("%d", &n);
        for (int u=0; u<n; u++)
        for (int v=0; v<n; v++)
            scanf("%d", &d[u][v]);
                
        //initialize
        memset(t, 0, sizeof(t));
        q = priority_queue<edge>();
        
        //prim
        take(0);
        int dmax = 0;
        for (int e=0; e<n-1; e++)
        {
            int u, v;
            do
            {
                u = q.top().u;
                v = q.top().v;
                q.pop();
            } while (t[u] && t[v]); 
            
            take(!t[u] ? u : v);
            dmax = max(dmax, d[u][v]);
        }
        
        //output
        if (c) printf("\n");
        printf("%d\n", dmax);
    }
    
    return 0;
}
        
                                 
