import Data.Graph

graph = buildG (1, 6) [(1, 2), (1, 3), (2, 4), (5, 6)]

main = do
  print graph
  print $ vertices graph
  print $ edges graph
  print $ edges $ transposeG graph

  print $ outdegree graph
  print $ indegree graph

  print $ topSort graph
  print $ reachable graph 1

  print $ path graph 1 4
  print $ path graph 1 5

  print $ components graph
  print $ scc graph
  print $ bcc graph

  print $ dff graph
  print $ dfs graph [2]

