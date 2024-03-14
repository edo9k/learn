import Text.Printf (printf)
import Data.List (sortBy)
import Data.Ord (comparing) 

type Tuple3 = (Int, Int, Int)


sortByDifference :: [Tuple3] -> [Tuple3] 
sortByDifference t = sortBy (comparing (\(_, _, z) -> z)) t


getDiff :: Int -> Tuple3
getDiff x = (num, mirrorNum, difference)
  where 
    num = x
    mirrorNum  = read $ reverse $ show num
    difference = abs  $ num - mirrorNum 


table :: [Tuple3] -> IO ()
table t = do
  putStrLn " | Original | Reversed | Diff | " 
  putStrLn " | -------- | -------- | ---- | "
  mapM_ printTuple t
  where
    printTuple (a, b, c) =
       putStrLn $ printf " | %8d | %8d | %4d | " a b c 

main = do
  putStrLn "Se duas pessoas têm 7 anos de diferença," 
  putStrLn "com quais idades eles teriam números invertidos?" 
  putStrLn "Exemplo: 21 e 12, se a diferença fosse de 9 anos."
  putStrLn "" 
  table $ sortByDifference $ map getDiff [1..99] 
