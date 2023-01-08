
iter fibonacci(n: int) {
  var (current, next) = (0, 1);
  
  for 1..n {
    yield current;
    (current, next) = (next, current + next);
  }
}


writeln("the first few fibonacci numbers (via generator): ");

for indexVar in fibonacci(10) do
  write(indexVar, ", ");

writeln("...");
writeln(); 


// zipping values

for (i, j) in zip(fibonacci(10), 1..) {
  write("The ", j);

  select j {
    when 1 do write("st");
    when 2 do write("nd");
    when 3 do write("rd");
    otherwise write("th");
  }

  writeln(" Fibonacci number is ", i);
}


writeln();


// outer cartesian product of indexes in two ranges
// yielded as tuples

iter multiloop(n: int) {
  for i in 1..n do
    for j in 1..n do
      yield (i, j);
}

writeln("multiloop tuples");
writeln(multiloop(3));
writeln();


// iterating of tree in post order

class Tree {
  var data: string;
  var left, right: owned Tree?;
}

iter postorder(tree: borrowed Tree?): borrowed Tree {
  if tree {

    if tree!.left {

      for child in postorder(tree!.left) do
        yield child;
    }

    if tree!.right {

      for child in postorder(tree!.right) do
        yield child;
    }

    yield tree!;
  }
}


var tree = new Tree( "a",
  new Tree("b"),
  new Tree("c",
    new Tree("d"),
    new Tree("e")));


proc Tree.writeThis(x) {
  var first = true;

  for node in postorder(this) {
    if first then
      first = false;
    else
      x.write(" ");

    x.write(node.data);
  }
}

writeln("Tree Data");
writeln(tree);
writeln();



// iterating in parallel 

proc decorate(s:string) return "node_" + s;

writeln("Task parallel iteration");

coforall node in postorder(tree) do
  node. data = decorate(node.data);

writeln(tree);
writeln();

