import Data.List

-- getting all unique permutations

f = intercalate " " . nub . permutations

-- getting all permuations
-- and marking the ones equal to the
-- original word

mark word list =
  ( \word -> if word == "kafka"
    then "["++word++"]"
    else " "++word++" " )
  list

g = intercalate " " 
  . mark "kafka" 
  . permutations


-- main
main = do
  putStrLn $ f "kafka"
  putStrLn "--"
  putStrLn $ g "kafka"

