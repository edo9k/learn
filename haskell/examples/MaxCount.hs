
{-
 - Naive implementation of basic exercise. 
 - Read several numbers from standart input
 - Finds the highest number and how many occurencies
 - are there. Displays results.
-}


getMaxAndCount :: [Int] -> (Int, Int) -> (Int, Int)
getMaxAndCount []      (number, count) = (number, count)
getMaxAndCount (x:xs)  (number, count)
  | x == number = getMaxAndCount xs (number, count + 1) 
  | x >  number = getMaxAndCount xs (x, 1) 
  | otherwise   = getMaxAndCount xs (number, count)


getNumbers :: [Int] -> IO [Int] 
getNumbers list = do
  userInput <- getLine
  if userInput /= "fim" 
  then

    let 
      next = (read userInput :: Int)
    in 
      getNumbers (list ++ [next]) 
    
  else
    return list 


main = do
  putStrLn "Digite um número por linha (com enter)"
  putStrLn "para teminar o input, digite fim."

  numberList <- getNumbers [] 
  print $ getMaxAndCount numberList (0, 0)

