
Install OCaml and the Opium framework 

    sudo apt install ocaml opam

    opam instal opium 


Then compile with the following command

    ocamlfind ocamlc -o server -linkpkg -thread -package opium server.ml 


And run the resulting excecutable. 
