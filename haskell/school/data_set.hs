import qualified Data.Set as Set

set = Set.fromList "foo bar"

main = do
  print set
  print $ Set.null set
  print $ Set.size set
  print $ Set.member 'a' set

