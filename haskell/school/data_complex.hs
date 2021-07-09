import Data.Complex

number = 3 :+ 4

main = do
  print number
  print $ realPart number
  print $ imagPart number
  print $ polar number
  print $ magnitude number
  print $ phase number
  print $ conjugate number

