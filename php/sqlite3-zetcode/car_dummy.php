<?php

$vowels = str_split('aeiou');
$consonants = str_split('bcdfghjklmpqrstvwxyz');

$syllables = array_merge(...array_map(
	fn ($consonant) => 
		array_map( fn ($vowel) =>  
			$consonant . $vowel
		, $vowels)
	, $consonants));

/*
 *  returns random three syllable car name 
 *          based on the syllables built above
 *          first letter is capitalized 
 *          example: Bacedi
 */
function randomName(): string { 
	global $syllables; 

	return  ucfirst( 
		$syllables[array_rand($syllables)] 
	.	$syllables[array_rand($syllables)]
	.	$syllables[array_rand($syllables)]
	.	$syllables[array_rand($syllables)]);
};


/*
 *  returns random integer (year) between 1965~2022
 *          example: 1984
 */
function randomYear(): int {
	return random_int(1965, 2022);
}


/*
 *  returns random string, with "car name" and "year".
 *          example: Xuzeku 1999
 */
function carName(): string {
	return randomName() . " " . randomYear();
}


/*
 *  returns random integer (price) between 25000~999000
 *          example: 27999
 */
function carPrice(): int {
  return random_int(25000, 999000);
}

