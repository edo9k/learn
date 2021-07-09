import Prelude hiding (null, map, filter)
import Data.HashSet
import Data.Char

hashSet = fromList ['a', 'b', 'c']

main = do
  print $ hashSet

  print $ null hashSet
  print $ size hashSet

  print $ member 'a' hashSet
  print $ member 'e' hashSet

  print $ insert 'd' hashSet
  print $ delete 'b' hashSet

  print $ map (toUpper) hashSet
  print $ filter (> 'a') hashSet

