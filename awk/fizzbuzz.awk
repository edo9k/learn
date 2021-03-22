
BEGIN {
  if (!n) n=100
  print "# FizzBuzz:"

  for(i=1; i<=n; i++)
    if (i % 15 == 0)
      {print "FizzBuzz"}
    else if (i % 3 == 0)
      {printf "Fizz"}
    else if (i % 5 == 0)
      {printf "Buzz"}
    else 
      {printf "%3d\n", i}

  print "\n# Done."
}

