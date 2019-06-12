// Problem#: 1935 ¶þ²æÊ÷ÖØ½¨ 
#include <cstdio>
#include <iostream>
#include <cstring>
#include <string>
using namespace std;

char s1[30], s2[30];
char lv[30][30];
int ln[30];

void build(int n, int dep, char* s1, char* s2)
{
     if (n <= 0) return;
     int p = strchr(s2, s1[0]) - s2;
     lv[dep][ln[dep]++] = s1[0];
     build(p, dep+1, s1+1, s2);
     build(n-p-1, dep+1, s1+p+1, s2+p+1);
}

int main()
{
    int t;
    for(scanf("%d",&t); t>0; t--)
    {
        scanf("%s %s", s1, s2);
        memset(ln, 0, sizeof(ln));
        build(strlen(s1), 0, s1, s2);
        for (int i = 0; i < 30; ++i) {
            for (int j = 0; j < ln[i]; ++j) {
                printf("%c", lv[i][j]);
            }
        }
        printf("\n");
    } 

    return 0;
}
                                 
