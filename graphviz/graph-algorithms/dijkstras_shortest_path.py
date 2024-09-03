import heapq

def dijkstra(graph, source):
    # Initialize distances and priority queue
    dist = {node: float('inf') for node in graph}
    dist[source] = 0
    priority_queue = [(0, source)]
    
    while priority_queue:
        current_dist, u = heapq.heappop(priority_queue)
        
        # Skip if the distance is outdated
        if current_dist > dist[u]:
            continue
        
        for neighbor, weight in graph[u].items():
            distance = current_dist + weight
            
            if distance < dist[neighbor]:
                dist[neighbor] = distance
                heapq.heappush(priority_queue, (distance, neighbor))
    
    return dist

# Example usage
graph = {
    'A': {'B': 1, 'C': 4},
    'B': {'C': 2, 'D': 5},
    'C': {'D': 1},
    'D': {}
}
print(dijkstra(graph, 'A'))  # Output: {'A': 0, 'B': 1, 'C': 3, 'D': 4}

