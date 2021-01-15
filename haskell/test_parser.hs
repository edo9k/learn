module Main where

data PersonRecord = MkPersonRecord {
  name    :: String,
  address :: Address,
  id      :: Integer,
  labels  :: [Label]
} deriving (Show)

data Address = MkAddress {
  line1     :: String,
  number    :: Integer,
  street    :: String,
  town      :: String,
  postcode  :: String
} deriving (Show)

data Label = Green | Red | Blue | Yellow deriving (Show)

rec1 = MkPersonRecord
  "Fulano de Tal"
  (MkAddress "Tal Lugar" 42 "Rua tals" "Vitoria" "29123-321")
  55432
  [Green, Red]

rec2 = MkPersonRecord
  "Beltrano Cicrano"
  (MkAddress "Outro Lugar" 69 "Rua aquela" "Serra" "29123-010")
  6502 
  [Green, Yellow]

main = putStrLn $ show [rec1, rec2]

