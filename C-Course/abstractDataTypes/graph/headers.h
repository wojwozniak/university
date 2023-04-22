typedef struct graph graph;

graph *create_graph(int numnodes);
void destroy_graph(graph *g);
void print_graph(graph *g);
bool add_edge(graph *g, int from_node, int to_node);
bool has_edge(graph *g, int from_node, int to_node);
bool *traverse(graph *g, int from_node, int this_node, bool visited[], int depth);
int intergrity(graph *g);
