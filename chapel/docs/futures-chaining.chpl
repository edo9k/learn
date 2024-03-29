
use Futures;

config const X = 42;

const F = async(lambda(x: int) { return 2 * x; }, X)
            .andThen(lambda(x: int) { return x + 7; })
            .andThen(lambda(x: int) { return 3 * x; });

writeln(F.get() == (3 * ((2 * X) + 7))); // should print "true" 


config const Y = 1234;

const G = async(lambda(x:int) { return x:string; }, Y)
            .andThen(lambda(x:string) { return(x.size); });


writeln(G.get()); // should print "4" 


