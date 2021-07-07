import Data.Char

-- should this character be cyphered
shouldcipher :: Char -> Bool
shouldcipher c = isLetter(c) && isAscii(c)

-- enciphers single char at a time 
cipherchar :: Int -> Char -> Char
cipherchar shift c
  | shouldcipher c  = chr(ord(c) + shift)
  | otherwise       = c

-- encipher a whole string
cipher :: Int -> [Char] -> [Char]
cipher shift plaintext = map (bettercipherchar shift) plaintext

-- do the same, except it's the opposite
decipher :: Int -> [Char] -> [Char]
decipher shift ciphertext = cipher (-shift) ciphertext

-- wrap text transformation
wraparound shift c
  | isLower(c) && ord(c) + shift > ord 'z' = True
  | isUpper(c) && ord(c) + shift > ord 'Z' = True
  | otherwise = False

-- tie it all up
bettercipherchar :: Int -> Char -> Char
bettercipherchar shift c 
  | shouldcipher c = chr(ord(c) + adjustedshift)
  | otherwise     = c
  where adjustedshift = let shift' = shift `mod` 26
                        in if (wraparound shift' c)
                          then shift' - 26
                          else shift'


