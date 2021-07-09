import Prelude hiding (null, lookup, map, filter)
import Data.HashMap.Lazy
import Data.Char

hashMap = fromList[(1 :: Int, 'a'), (2, 'b'), (3, 'c')]

main = do
  print $ hashMap
  print $ keys hashMap
  print $ elems hashMap

  print $ null hashMap
  print $ size hashMap

  print $ member 1 hashMap
  print $ member 5 hashMap

  print $ lookup 1 hashMap
  print $ lookup 5 hashMap

  print $ hashMap ! 1
  print $ lookupDefault 'N' 5 hashMap

  print $ insert 4 'd' hashMap
  print $ delete 2 hashMap

  print $ map (toUpper) hashMap
  print $ filter (> 'a') hashMap

