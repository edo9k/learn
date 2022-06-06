module Main

import Effects
import Effect.StdIO

hello : Eff () [STDIO]
hello = putStrLn "Hello, World!"

main : IO ()
main = run hello 

