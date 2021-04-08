<?php

echo "assorted utility classes \n\n";

echo "IntlChar provides unicoce information and functionality.\n";
echo "character name for @ -> ". IntlChar::charName('@') ."\n";
echo "character name for ! -> ". IntlChar::charName('!') ."\n";
echo "character name for ? -> ". IntlChar::charName('?') ."\n";
echo "character name for # -> ". IntlChar::charName('#') ."\n\n";

echo "is it punctuation? @ -> ". IntlChar::ispunct('@') ."\n";
echo "is it punctuation? ! -> ". IntlChar::ispunct('!') ."\n";
echo "is it punctuation? ? -> ". IntlChar::ispunct('?') ."\n";
echo "is it punctuation? # -> ". IntlChar::ispunct('#') ."\n\n";

echo "uppercasing special characters:\n";
$a="á";

echo "$a -> IntlChar::toupper -> ". IntlChar::toupper($a) ."\n";

echo "this package needs to be installed `sudo apt install php-intl`\n\n";

echo "CSPRNG provides cryptographically secure random bytes and integers.\n";
echo "You can make random passwords or tokens with this\n";
echo " random_bytes(15)  -> ". bin2hex(random_bytes(4)) ."\n";
echo " random_int(2, 32) -> ". random_int(2, 32) ."\n";

