// sicily Problem#: 1031 Campus
// The source code is licensed under Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License
// URI: http://creativecommons.org/licenses/by-nc-sa/3.0/
// All Copyright reserved by Informatic Lab of Sun Yat-sen University
#include <iostream>
#include <string>
#include <map>
#include <queue>
#include <vector>
#include <algorithm>
using namespace std;

const int N=202, M=100;
int n,m,s,t;
map<string,int> f;
int d[N][N];

vector<int> vout[N];

int best[N];
queue<int> q;

int main()
{
	int T;
	cin>>T;
	while (T--)
	{
		//initialize
		f.clear();
		fill(vout,vout+N,vector<int>());
		
		//input
		string a,b;
		cin>>m;
		while (m--)
		{
			cin>>a>>b;
			if (f.find(a)==f.end()) f[a]=f.size()-1;
			if (f.find(b)==f.end()) f[b]=f.size()-1;
			int u,v;
			u=f[a];
			v=f[b];
			
			vout[u].push_back(v);
			vout[v].push_back(u);
			cin>>d[u][v];
			d[v][u]=d[u][v];
		}
		
		cin>>a>>b;
		if (f.find(a)==f.end()) f[a]=f.size()-1;
		if (f.find(b)==f.end()) f[b]=f.size()-1;
		s=f[a];
		t=f[b];
		
		n=f.size();
		
		//initialize
		fill(best,best+n,INT_MAX);
		best[s]=0;
		
		//bfs
		q.push(s);
		while (!q.empty())
		{
			int u=q.front();
			for (int x=0; x<vout[u].size(); x++)
			{
				int v=vout[u][x];
				if (best[v] > best[u]+d[u][v])
				{
					best[v] = best[u]+d[u][v];
					q.push(v);
				}
			}
			q.pop();
		}
		
		cout<<(best[t]!=INT_MAX ? best[t] : -1)<<endl;
	}
	
	return 0;
}
		

                                 
