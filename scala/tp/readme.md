
# Scala Tutorial

From the Tutorials Point collection: 

https://www.tutorialspoint.com/scala

Scala can be install via apt with `sudo apt install scala` 


Compile programs with `scalac`, or run them with `scala` 
(which is also the repl entry point).

I'm getting Java missing packages while running Scala with the Java
OpenJRE 11 and the Scala package from the Ubuntu/Debian sources.

To run the programs without error, there's this workaround


```
scala -nobootcp -nc MyFile.scala
```

