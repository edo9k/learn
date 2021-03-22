
# returns min
function find_min(a, b) {
  if (a < b)
    return a
  return b
}

# returns max
function find_max(a, b) {
  if (a > b)
    return a
  return b
}

function main(a, b) {
  result = find_min(a, b)
  print "Minimum: ", result

  result = find_max(a, b)
  print "Maximum: ", result
}

# execution entry point
BEGIN {
  main(10, 20)
}

