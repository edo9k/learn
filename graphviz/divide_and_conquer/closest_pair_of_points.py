import math

def dist(p1, p2):
    return math.sqrt((p1[0] - p2[0]) ** 2 + (p1[1] - p2[1]) ** 2)

def brute_force(points):
    min_dist = float('inf')
    n = len(points)
    for i in range(n):
        for j in range(i + 1, n):
            if dist(points[i], points[j]) < min_dist:
                min_dist = dist(points[i], points[j])
    return min_dist

def closest_pair_of_points(points):
    if len(points) <= 3:
        return brute_force(points)

    mid = len(points) // 2
    left_half = points[:mid]
    right_half = points[mid:]

    dl = closest_pair_of_points(left_half)
    dr = closest_pair_of_points(right_half)
    d = min(dl, dr)

    mid_x = points[mid][0]
    strip = [p for p in points if abs(p[0] - mid_x) < d]

    min_dist_strip = float('inf')
    strip.sort(key=lambda x: x[1])  # Sort by y coordinate

    for i in range(len(strip)):
        for j in range(i + 1, len(strip)):
            if strip[j][1] - strip[i][1] >= d:
                break
            min_dist_strip = min(min_dist_strip, dist(strip[i], strip[j]))

    return min(d, min_dist_strip)

# Example usage
points = [(2, 3), (12, 30), (40, 50), (5, 1), (12, 10), (3, 4)]
points.sort()  # Sort by x coordinate
print(closest_pair_of_points(points))  # Output: 1.4142135623730951

