def bellman_ford(graph, source):
    # Step 1: Initialize distances from source to all other vertices as infinite
    dist = {node: float('inf') for node in graph}
    dist[source] = 0
    
    # Step 2: Relax all edges |V| - 1 times
    for _ in range(len(graph) - 1):
        for u in graph:
            for v, weight in graph[u].items():
                if dist[u] != float('inf') and dist[u] + weight < dist[v]:
                    dist[v] = dist[u] + weight
    
    # Step 3: Check for negative-weight cycles
    for u in graph:
        for v, weight in graph[u].items():
            if dist[u] != float('inf') and dist[u] + weight < dist[v]:
                return "Graph contains a negative-weight cycle"
    
    return dist

# Example usage
graph = {
    'A': {'B': 1, 'C': 4},
    'B': {'C': -3, 'D': 2},
    'C': {'D': 3},
    'D': {}
}
print(bellman_ford(graph, 'A'))  # Correct Output: {'A': 0, 'B': 1, 'C': -2, 'D': 1}

