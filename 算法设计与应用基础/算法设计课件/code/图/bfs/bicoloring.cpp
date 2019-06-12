/*****
PC 110901 / UVa 10004, Bicolording.
In 1976 the ``Four Color Map Theorem" was proven with the assistance of a computer. This theorem states that every map can be colored using only four colors, in such a way that no region is colored using the same color as a neighbor region. 
Here you are asked to solve a simpler similar problem. You have to decide whether a given arbitrary connected graph can be bicolored. That is, if one can assign colors (from a palette of two) to the nodes in such a way that no two adjacent nodes have the same color. To simplify the problem you can assume: 
no node will have an edge to itself. 
the graph is nondirected. That is, if a node a is said to be connected to a node b, then you must assume that b is connected to a. 
the graph will be strongly connected. That is, there will be at least one path from any node to any other node. 

Input  
The input consists of several test cases. Each test case starts with a line containing the number n ( 1 < n < 200) of different nodes. The second line contains the number of edges l. After this, l lines will follow, each containing two numbers that specify an edge between the two nodes that they represent. A node in the graph will be labeled using a number a ( ). 
An input with n = 0 will mark the end of the input and is not to be processed. 

Output  
You have to decide whether the input graph can be bicolored or not, and print it as shown below. 

Sample Input  
3
3
0 1
1 2
2 0
9
8
0 1
0 2
0 3
0 4
0 5
0 6
0 7
0 8
0

Sample Output  
NOT BICOLORABLE.
BICOLORABLE.
*/
#include <queue>
#include <iostream>
using namespace std;

#define MAXV 1000           /*maximum vertices numbers*/
bool bipartie;              /* is bipartie graph? */
enum color_type {UNCOLORED,WHITE,BLACK};
color_type color[MAXV+1];

bool processed[MAXV+1];
bool discovered[MAXV+1];
int  parent[MAXV+1];

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
    for (i=0; i<=MAXV; i++) 
        g->degree[i] = 0;
    for (i=0; i<=MAXV; i++) 
        g->edges[i] = NULL;
}

void insert_edge(graph *g, int x, int y, bool directed)
{
	edgenode *p = new edgenode();
	//p = (edgenode*) malloc(sizeof(edgenode));
    p->weight = 1;
	p->y = y;
	p->next = g->edges[x];
	
    g->edges[x] = p; /* insert at head of list */
	
    g->degree[x] ++;
	if (directed == false)
		insert_edge(g,y,x,true);
	else
		g->nedges ++;
}

void read_graph(graph *g, bool directed)
{ 
	int i;
	int m;
	int x, y;
	initialize_graph(g, directed);
	scanf("%d%d",&(g->nvertices),&m);
    for (i=1; i<=m; i++) {
		scanf("%d%d",&x,&y);
		insert_edge(g,x,y,directed);
    }

}

void initialize_search(graph *g)
{
   int i;
   for (i=0; i<g->nvertices; i++) {
     processed[i] = discovered[i] = false;
     parent[i] = -1;
   }
}
void process_vertex_early(int v)
{
	 //printf("processed vertex %d\n",v);
}
void process_vertex_late(int v)
{
}
color_type complement(int color)
{
    if (color == WHITE) return (BLACK);
    if (color == BLACK) return (WHITE);
    
    return (UNCOLORED);
}
void process_edge(int x, int y)
{
   //printf("processed edge (%d,%d)\n",x,y);
   /* count number of edges: nedges = nedges + 1; */
   if ( color[x] == color[y] ) {
     bipartie = false;
     //cout << "bipartie = false" << endl;
   }
   color[y] = complement(color[x]);
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
	while ( !q.empty() ) {
		v = q.front(); q.pop(); //v = dequeue(&q);
		process_vertex_early(v);
		p = g->edges[v];
		while (p != NULL) {
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
        process_vertex_late(v);
      }
      processed[v] = true;
}


int twocolor(graph *g)
{
    //cout << "temp g->nvertices=" << g->nvertices << endl;
    for(int i=0; i < (g->nvertices); i++)
      color[i] = UNCOLORED;
    //cout << "temp";
    bipartie = true;
    
    //initialize_search(g);
    
//    for(i=0;i<(g->nvertices);i++)
//    {
//      if (discovered[i]==false) {
//        color[i] = WHITE;
//        bfs(g,i);
//      }
//    }
     color[0] = WHITE;
     bfs(g,0);
      //cout << "color[" << i << "]=" << color[i] << endl;
    
}

int main()
{
   int n, m, x, y;
   graph g;
   
   cin>>n;
   while( n != 0 )
   {
     initialize_graph(&g,false);

     (g.nvertices) = n;
     cin >> m;
     for(int i=1;i<=m;i++) {
       cin >> x >> y;
       insert_edge(&g,x,y,false);
     }
     twocolor(&g);
   
     if (bipartie==true) cout << "BICOLORABLE." << endl;
     else cout << "NOT BICOLORABLE." << endl;

     cin >> n;   
   }
}

