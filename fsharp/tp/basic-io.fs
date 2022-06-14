open System

let main() =
  Console.Write("Enter your name... ")
  let name = Console.ReadLine()
  Console.Write("Hello, {0}!\n", name)
  Console.WriteLine(System.String.Format("Formatting example: {0} and {1}",
    "Ping", "Pong"))
  Console.WriteLine(System.String.Format("|{0:yyyy-MMM-dd}|", System.DateTime.Now))


// run main

main()

