//
// Created by 李新锐 on 10/07/2018.
//

#include <algorithm>
#include <cstdio>
#include <utility>
#include <vector>

using namespace std;

double inf = 1e+10;
double eps = 1e-10;

inline int sgn(const double &x) {
  return (x > +eps) - (x < -eps);
}

const int MAXN = 500;
const int MAXM = 501;
int n, m;
double A[MAXM + 1][MAXN + 1], X[MAXN];
int basis[MAXM + 1], out[MAXN + 1];

void pivot(int a, int b) {
  for (int i = (0); i <= (m); ++i)
    if (i != a && sgn(A[i][b]))
      for (int j = (0); j <= (n); ++j)
        if (j != b)
          A[i][j] -= A[a][j] * A[i][b] / A[a][b];
  for (int j = (0); j <= (n); ++j)
    if (j != b)
      A[a][j] /= A[a][b];
  for (int i = (0); i <= (m); ++i)
    if (i != a)
      A[i][b] /= -A[a][b];
  A[a][b] = 1 / A[a][b];
  swap(basis[a], out[b]);
}

double simplex() {
  for (int j = 0; j < (n); ++j)
    A[0][j] = -A[0][j];
  for (int i = (0); i <= (m); ++i)
    basis[i] = -i;
  for (int j = (0); j <= (n); ++j)
    out[j] = j;
  for (;;) {
    int ii = 1, jj = 0;
    for (int i = (1); i <= (m); ++i)
      if (make_pair(A[i][n], basis[i]) < make_pair(A[ii][n], basis[ii]))
        ii = i;
    if (A[ii][n] >= 0)
      break;
    for (int j = 0; j < (n); ++j)
      if (A[ii][j] < A[ii][jj])
        jj = j;
    if (A[ii][jj] >= 0)
      return -inf;
    pivot(ii, jj);
  }
  for (;;) {
    int ii = 1, jj = 0;
    for (int j = 0; j < (n); ++j)
      if (make_pair(A[0][j], out[j]) < make_pair(A[0][jj], out[jj]))
        jj = j;
    if (A[0][jj] >= 0)
      break;
    for (int i = (1); i <= (m); ++i)
      if (A[i][jj] > 0 &&
          (A[ii][jj] <= 0 || make_pair(A[i][n] / A[i][jj], basis[i]) <
                                 make_pair(A[ii][n] / A[ii][jj], basis[ii])))
        ii = i;
    if (A[ii][jj] <= 0)
      return +inf;
    pivot(ii, jj);
  }
  for (int j = 0; j < (n); ++j)
    X[j] = 0;
  for (int i = (1); i <= (m); ++i)
    if (basis[i] >= 0)
      X[basis[i]] = A[i][n];
  return A[0][n];
}

int d;
vector<int> adj[500];
vector<int> wei[500];

void dfs(double A[], int u, int p, int d) {
  if (d >= 0) {
    A[u]--;
    for (int i = 0; i < ((int((adj[u]).size()))); ++i) {
      int v = adj[u][i];
      if (v != p) {
        dfs(A, v, u, d - wei[u][i]);
      }
    }
  }
}

int main() {
  scanf("%d%d", &n, &d);
  int ttl = 0;
  for (int i = 0; i < (n); ++i) {
    int ti;
    scanf("%d", &ti), A[0][i] = ti - 1, ttl += ti;
  }
  for (int i = 0; i < (n - 1); ++i) {
    int u, v, w;
    scanf("%d%d%d", &u, &v, &w), --u, --v;
    adj[u].push_back(v), adj[v].push_back(u);
    wei[u].push_back(w), wei[v].push_back(w);
  }
  A[0][n] = 0;
  for (int i = 0; i < (n); ++i) {
    dfs(A[i + 1], i, -1, d);
    A[i + 1][n] = -1;
  }
  for (int i = 0; i < (n); ++i)
    A[n + 1][i] = 1;
  A[n + 1][n] = ttl;
  m = n + 1;
  double get = simplex();
  int ans;
  if (get == -inf)
    ans = -1;
  else
    ans = -get + 0.5;
  printf("%d\n", ans);
}