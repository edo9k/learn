a = [1, 2, 3, 4, 5]
b = [1, 2, 3, 4, 5]

p = [true, false]
q = [true, false] 
r = [true, false] 

for( _p of p)  {
  for ( _q of q) {  
    for (_r of r) { 
      console.log({ _p, _q, _r })
    }
  }
} 
