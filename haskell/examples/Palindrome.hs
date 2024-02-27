import Test.QuickCheck
import Data.Char (toLower) 

-- main :: IO ()
-- main = do
--   putStrLn "Enter a word to check if it's a palindrome: "
--   input <- getLine
--   let word = filter (/= ' ') input -- filter spaces out 
--   if isPalindrome word
--     then putStrLn $ "The word '" ++ input ++ "' is a palindrome." 
--     else putStrLn $ "The word '" ++ input ++ "' is not a palindrome." 

main :: IO ()
main = do
  putStrLn "Running QuickCheck tests..." 
  quickCheck prop_palindromeRemainsPalindrome
  quickCheck prop_nonPalindromeIsNotPalindrome


isPalindrome :: String -> Bool
isPalindrome word = word == reverse word 

prop_palindromeRemainsPalindrome :: String -> Bool 
prop_palindromeRemainsPalindrome word = isPalindrome word == (word' == reverse word') 
  where word' = map toLower word

prop_nonPalindromeIsNotPalindrome :: String -> Property
prop_nonPalindromeIsNotPalindrome word = 
  not (isPalindrome word) ==> word' /= reverse word' 
  where word' = map toLower word 


