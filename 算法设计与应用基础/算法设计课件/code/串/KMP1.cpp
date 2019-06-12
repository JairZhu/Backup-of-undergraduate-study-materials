#include <cstdio>
#include <iostream>
#include <cstring>
#include <string>
using namespace std;
const int XSIZE = 110, YSIZE = 10010;

void preKmp(char *x, int m, int kmpNext[]) {
   int i, j;

   i = 0;
   j = kmpNext[0] = -1;
   while (i < m) {
      while (j > -1 && x[i] != x[j])
         j = kmpNext[j];
      i++;
      j++;
      if (x[i] == x[j])
         kmpNext[i] = kmpNext[j];
      else
         kmpNext[i] = j;
   }
}


void KMP(char *x, int m, char *y, int n) {
   int i, j, kmpNext[XSIZE];

   /* Preprocessing */
   preKmp(x, m, kmpNext);

   /* Searching */
   i = j = 0;
   while (j < n) {
      while (i > -1 && x[i] != y[j])
         i = kmpNext[i];
      i++;
      j++;
      if (i >= m) {
         printf("%d",j - i);
         i = kmpNext[i];
      }
   }
}

int main()
{
  char P[XSIZE], T[YSIZE];
  int i, j;
  //int m = 0, n = 0;
  gets(T);
  gets(P);
  puts(T);
  puts(P);
  //while(X[m]!='\0') ++m; cout << m << endl;
  //while(Y[n]!='\0') ++n; cout << n << endl;
  for (i=0; T[i] != '\0'; i++)
  {
    for (j=0; T[i+j] != '\0' && P[j] != '\0' && T[i+j]==P[j]; j++) ;
    if (P[j] == '\0') //found a match
    { cout << "found a match at position " << i << endl; break;}
  }  
  //printf("%s\n",S);
}
