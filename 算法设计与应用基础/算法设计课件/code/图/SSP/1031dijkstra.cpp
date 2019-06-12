// sicily Problem#: 1031 Campus
// Submission#: 104484
// The source code is licensed under Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License
// URI: http://creativecommons.org/licenses/by-nc-sa/3.0/
// All Copyright reserved by Informatic Lab of Sun Yat-sen University

#include <iostream>
#include <string>
#include <map>
#include <queue>
#include <vector>
using namespace std;

typedef vector <int> vi;
typedef pair <int, int> ii;
typedef vector <ii> vii;
typedef vector <vii> vvii;

int Dijkstra (const vvii& G, int s, int t)
{
	const int INF = 1000000000;
	int n = G.size ();
	vi D (n, INF);
	priority_queue < ii, vector <ii>, greater <ii> > Q;
	D [s] = 0;
	Q.push (ii (0, s));
	while (Q.size ())
		{
		ii p = Q.top ();
		Q.pop ();
		int d = p.first, v = p.second;
		if (v == t) break;
		if (D [v] < d) continue;
		for (int i = 0, j = G [v].size (); i < j; i ++)
			{
			int v2 = G [v] [i].first, d = G [v] [i].second;
			if (D [v2] > D [v] + d)	// D [v] != INF && d != INF
				{
				D [v2] = D [v] + d;
				Q.push (ii (D [v2], v2));
				}
			}
		}
	return (D [t] == INF ? -1 : D [t]);
}

int main ()
{
	//freopen ("in", "r", stdin);
	int t, n, d, u, v, id;
	string su, sv;
	cin >> t;
	while (t --){
		map <string, int> m;
		vvii G (201);
		id = 0;
		cin >> n;
		for (int i = 0; i < n; i ++){
			cin >> su >> sv >> d;
			if (!m [su]) u = m [su] = ++ id;
			else u = m [su];
			if (!m [sv]) v = m [sv] = ++ id;
			else v = m [sv];
			if (u == v) continue;
			G [u].push_back (ii (v, d));
			G [v].push_back (ii (u, d));
		}
		cin >> su >> sv;
		u = m [su];
		v = m [sv];
		if (su == sv){
			cout << 0 << endl;
			continue;
		}
		if (!u || !v){
			cout << -1 << endl;
			continue;
		}
		cout << Dijkstra (G, u, v) << endl;
	}
	return 0;
}
                                 
