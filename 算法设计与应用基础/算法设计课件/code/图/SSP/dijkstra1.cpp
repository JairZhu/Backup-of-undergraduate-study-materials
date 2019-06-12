/*****
Dijkstra's single source shortest path algorithm
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
void insert_edge(graph *g, int x, int y, int w, bool directed)
{
	edgenode *p;
	p = (edgenode*) malloc(sizeof(edgenode));
	p->weight = w;
	p->y = y;
	p->next = g->edges[x];
	
    g->edges[x] = p; /* insert at head of list */
	
    g->degree[x] ++;
	if (directed == false)
		insert_edge(g,y,x,w,true);
	else
		g->nedges ++;
}

void read_graph(graph *g, bool directed)
{ 
	int i;
	int m;    // |E|  
	int x, y, w;
	initialize_graph(g, directed);
	scanf("%d%d",&(g->nvertices),&m);
    for (i=1; i<=m; i++) {
		scanf("%d%d%d",&x,&y,&w);
		insert_edge(g,x,y,w,directed);
    }

}
/*****
Graph Defition
End
*/


/*****
Dijkstra
Begin
*/
const int MAXINT = 1000000;
int parent[MAXINT + 1];


void dijkstra(graph *g, int start)
{
  int i;                      /* counter */
  edgenode *p;                /* temporary pointer */
  bool intree[MAXV + 1];      /* is the vertex in thr tree yet? */
  int distance[MAXV + 1];     /* cost of adding to tree */
  int v;                      /* current vertex to process */
  int w;                      /* candidate next vertex */
  int weight;                 /* edge weight */
  int dist;                   /* best current distance from start vertex*/
  
  for ( i=1; i<=g->nvertices; i++ )
  {
    intree[i] = false;
    distance[i] = MAXINT;
    parent[i] = -1;
  }
  
  distance[start] = 0;
  v = start;
  
  while (intree[v] == false)
  {
    intree[v] = true;
    p = g->edges[v];
    while ( p != NULL )
    {
      w = p->y;
      weight = p->weight;
      if ( distance[w] > distance[v]+weight )
      {
        distance[w] = distance[v] + weight;
        parent[w] = v;
      }
      p = p->next;
    }
    
    v = 1;
    dist = MAXINT;
    for ( i=1; i<=g->nvertices; i++ )
      if ( (intree[i] == false) && (dist > distance[i]) )
      {
        dist = distance[i];
        v = i;
      }
  }
}


/*****
dijkstra
End
*/

void find_path(int start, int end, int parent[])
{
  if ( (start == end) || (end == -1) )
    printf("\n%d",start);
  else {
    find_path(start,parent[end],parent);
    printf(" %d",end);
  }
}

int main()
{
    graph g;
    read_graph(&g, false);
    dijkstra(&g,1); /* The Shortest Path is stored in parent[] */

    /* output the Shortest Paths*/
    edgenode *p;  
    for (int i = 1; i <= g.nvertices; i++)
    {
      printf("The shoretest path from 1 to %d is:",i);
      find_path(1,i,parent);
      printf("\n");
    }
}
/* Test Data
input:
3 3
1 2 1
2 3 2
1 3 4
output:
The shoretest path from 1 to 1 is:
1
The shoretest path from 1 to 2 is:
1 2
The shoretest path from 1 to 3 is:
1 2 3
*/ 
