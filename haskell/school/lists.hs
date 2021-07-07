list = [2019, 2020, 2021, 2022, 2048, 6505, 8086]

main = do
  putStrLn "-- print the list"
  print list

  putStrLn "-- head tail last init"
  print $ head list -- first item
  print $ last list -- last item
  print $ tail list -- everything but first
  print $ init list -- everything but last

  putStrLn "--  !! elem "
  print $ list !! 3       -- what is stored in index 3 (2022)
  print $ elem 6508 list  -- does 6502 exist on the list? (True)

  putStrLn "-- length null reverse"
  print $ length list
  print $ null list     -- is the list null? (False)
  print $ reverse list

  putStrLn "-- take drop minimum maximum"
  print $ take 2 list
  print $ drop 2 list
  print $ maximum list
  print $ minimum list
  
  putStrLn "-- sum product"
  print $ sum list
  print $ product list

  putStrLn "-- .. completion operator"
  print [1..10]
  print ['A'..'Z']
  print [2, 4..20]

  putStrLn "-- take cycle map"
  print $ take 10 $ cycle [1..3]
  print $ map (+1) list

  putStrLn "-- filter all any even odd"
  print $ filter (>2030) list
  print $ all even list
  print $ any odd list

  putStrLn "-- foldr foldr1 foldl foldl1"
  print $ foldr  (+) 0 list
  print $ foldr1 (+) list
  print $ foldl  (+) 0 list
  print $ foldl1 (+) list
  
  putStrLn "-- scanr scanr1 scanl scanl1"
  print $ scanr  (+) 0 list
  print $ scanr1 (+) list
  print $ scanl  (+) 0 list
  print $ scanl1 (+) list

  putStrLn "-- take repeat replicate drop"
  print $ take 10 $ repeat 0
  print $ replicate 10 0
  print $ drop 3 list

  putStrLn "-- ++ zip unzip zipWith [list comprehension]"
  print $ ['a', 'b'] ++ ['c']
  print $ zip [1, 2, 3] ['a', 'b', 'c']
  print $ unzip [(1, 'a'), (2, 'b'), (3, 'c')]
  print $ zipWith (+) [1, 2, 3] [4, 5, 6]
  print $ [(x, y) | x <- [1..5], y <- ['a'..'e']]

  putStrLn "-- words unwords"
  print $ words "Hello World"
  print $ unwords ["Hello", "World"]

