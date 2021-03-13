
# Using SQLITE interface with C 

Tutorial from the official SQLITE page. 

https://www.sqlite.org/quickstart.html


## install required package

´´´
sudo apt install libsqlite3-dev
´´´

## compiling

´´´
gcc main.c -lsqlite3
´´´

## create a table & insert rows

´´´
./a.out db.sqlite "CREATE TABLE names(id INTEGER PRIMARY KEY, name TEXT NOT NULL);"
./a.out db.sqlite "INSERT INTO names (name) VALUES ('Ford Prefect');"
./a.out db.sqlite "INSERT INTO names (name) VALUES ('Bilbo Baggins');"
./a.out db.sqlite "INSERT INTO names (name) VALUES ('Sam Wise');"
´´´

## query database

´´´
./a.out db.sqlite "SELECT * FROM names"
´´´


