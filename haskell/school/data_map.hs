import qualified Data.Map as Map

phoneBook = Map.fromList [(2020, "Covid"), (2021, "Plague")]

main = do
  print phoneBook
  print $ Map.lookup 2020 phoneBook
  print $ (Map.empty :: Map.Map Int Int)
  print $ Map.singleton 3 5
  print $ Map.insert 1 "abc" Map.empty
  print $ Map.null phoneBook
  print $ Map.size phoneBook
  print $ Map.toList phoneBook
  print $ Map.keys phoneBook
  print $ Map.elems phoneBook

