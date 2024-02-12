
import networkx as nx
import matplotlib.pyplot as plt 
import random 


class GraphVisualization:
  
  def __init__(self):
    self.visual = []

  def addEdge(self, a, b):
    temp = [a, b]
    self.visual.append(temp)

  def visualize(self):
    G = nx.Graph()
    G.add_edges_from(self.visual)
    nx.draw_networkx(G)
    plt.show()


f = lambda: random.randrange(0, 10) 

G = GraphVisualization()

for i in range(2)
  G.addEdge(f(), f())

G.visualize() 
