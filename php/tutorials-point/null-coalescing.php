<?php 

echo "the null coalescing operator (??) will return the first\n";
echo "expression of the chain that evaluates to true.\n";
echo "in this case, the string 'not passed'\n";

$username = $_GET['username'] ?? 'not passed';
echo $username ."\n\n";

/*
 * this is equivalent to the following ternary 
 * $username = isset($_GET['username']) ? $_GET['username'] : 'not passed';
 */


echo "null coalescing operators can be chained.\n";

$username = $_GET['username'] ?? $_POST['username'] ?? 'not passed';
echo $username ."\n";

