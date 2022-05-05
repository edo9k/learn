
let main() =
  printfn "f# has a for-to" 
  for i = 1 to 5 do
    printfn "counting... %i" i 

  printfn "and also a for-downto"
  for i = 5 downto 1 do
    printfn "counting... %i" i

  printfn "also for-in to iterate over enumerable collections"
  let covidYears = [ 2019; 2020; 2021; 2022 ] 
  for year in covidYears do
    printfn "%d was a Covid year." year

  printfn "you can also define range using seq (basically a list comprehension)"
  let multiplesOfTwo = seq { for i in 1..5 -> (i, i * 2) }
  for (number, timesTwo) in multiplesOfTwo do
    printfn "%d times two is %d" number timesTwo

  printfn "there's a while too"
  let mutable n = 0
  while (n < 5) do
    printfn "counting with a while... %d" n
    n <- n + 1

  printfn "nesting loops... because tutorials point said this example is good..."
  for i = 1 to 3 do
    for j = 1 to 3 do
      for k = 1 to 3 do
        printfn "%d * %d * %d = %d" i j k (i * j * k)


main() 
