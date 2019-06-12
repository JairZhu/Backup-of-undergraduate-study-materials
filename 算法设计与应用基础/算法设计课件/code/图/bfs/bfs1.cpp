/*****
Breadth Firest Search
Applications:
shoretest path in unweighted graph; 
finding connected components in undirected graph; 
bicoloring graph, see bicoloring.cpp, uva1004bicoloring.cpp;
*/
#include <queue>
#include <iostream>
using namespace std;

/*****
Graph Defition
Begin
*/
#define MAXV 1000           /*maximum vertices numbers*/
struct edgenode{
	int y;	                /*adjacency info*/
	int weight;             /*edge weight, if any*/
	struct edgenode *next;  /*next edge in list*/
};

struct graph{
    struct edgenode *edges[MAXV+1]; /*adjacency info*/
    int degree[MAXV+1];      /*outdegree of each vertex*/
    int nvertices;           /*number of vertices in graph*/
    int nedges;              /*number of edges in graph*/
    bool directed;           /*is the graph directed?*/
};

void initialize_graph(graph *g, bool directed)
{
    int i;
    g->nvertices = 0;
    g->nedges = 0;
	g->directed = directed;
    for (i=1; i<=MAXV; i++) 
        g->degree[i] = 0;
    for (i=1; i<=MAXV; i++) 
        g->edges[i] = NULL;
}

void insert_edge(graph *g, int x, int y, bool directed)
{
	edgenode *p;
	p = (edgenode*) malloc(sizeof(edgenode));
	p->weight = 1;
	p->y = y;

	p->next = g->edges[x];  
    g->edges[x] = p; /* insert at head of list */
	
    g->degree[x] ++;
	if (directed == false)  /* 插入边不是有向边，则需要在两个位置插入*/ 
		insert_edge(g,y,x,true);
	else
		g->nedges ++; /* 边的数目增加1，无向边虽然保存在两个位置，但只计为一条边 */
}

void read_graph(graph *g, bool directed)
{ 
	int i;
	int m;
	int x, y;
	initialize_graph(g, directed);
	scanf("%d%d",&(g->nvertices),&m); //输顶点数和边数 
    for (i=1; i<=m; i++) 
    {
		scanf("%d%d",&x,&y);
		insert_edge(g,x,y,directed);
    }
}


/*****
Graph Defition
End
*/


/*****
BFS
Begin
*/ 
bool processed[MAXV+1];
bool discovered[MAXV+1];
int  parent[MAXV+1];
void initialize_search(graph *g)
{
   int i;
   for (i=1; i<=g->nvertices; i++) {
     processed[i] = discovered[i] = false;
     parent[i] = -1;
   }
}

void process_edge(int x, int y)
{
	// do sth when the edge first discovered
    /* printf("processed edge (%d,%d)\n",x,y); */
    /* count number of edges: nedges = nedges + 1; */
}

void bfs(graph *g, int start)
{
	queue<int> q; /* queues of vertex to visit */
	int v;   /* current vertex */
	int y;   /* successor vertex */
	edgenode *p; /* temporary pointer */
	
    initialize_search(g);

    q.push(start);  //enqueue(&q,start);
	discovered[start] = true;
	while ( !q.empty() ) 
    {
		v = q.front(); q.pop(); //v = dequeue(&q);
		
        /* do sth when v discovered */
		cout << " " << v;
        
        p = g->edges[v];
		while (p != NULL) 
        {
		  y = p->y; 
		  if ((processed[y] == false) || g->directed)
              process_edge(v,y);
          if (discovered[y] == false) {
              q.push(y);//enqueue(&q,y);
              discovered[y] = true;
              parent[y] = v;
          }
          p = p->next;
        }
        processed[v] = true;
      }
}

void find_path(int start, int end, int parent[])
{
  if ( (start == end) || (end == -1) )
    printf("\n%d",start);
  else {
    find_path(start,parent[end],parent);
    printf(" %d",end);
  }
}
void connected_components(graph *g)
{
    int c;                      /* component number */
    int i;                      /* counter */
    
    initialize_search(g);
    
    c = 0;
    for (i=1; i<=g->nvertices; i++)
      if (discovered[i] == false)
      {
        c = c+1;
        printf("Component %d:", c);
        bfs(g,i);
        printf("\n");
      }
}
/*****
BFS
End
*/

int main()
{
    graph g;
    read_graph(&g, false);
    bfs(&g,1); 
    find_path(1,4,parent);
    connected_components(&g);
}

/***** 
Test Data 1
int main()
{
    graph g;
    read_graph(&g, false);
    bfs(&g,1); 
    find_path(1,4,parent);
}
输入的第一行包含两个整数n和m，n是图的顶点数，m是边数。
以下m行，每行是一个数对u v，表示存在边(u,v)。顶点编号从1开始。 
input:
7 11
1 3
1 6
1 7
2 3
2 4
2 5
2 7
3 5
3 6
4 5
5 6
output:
 1 7 6 3 2 5 4
1 7 2 4
 
Test Data 2
int main()
{
    graph g;
    read_graph(&g, false);
    connected_components(&g);
}
input:
9 12
1 3
1 6
1 7
2 3
2 4
2 5
2 7
3 5
3 6
4 5
5 6
8 9
output:
Component 1: 1 7 6 3 2 5 4
Component 2: 8 9
*/ 
