{-# LANGUAGE OverloadedStrings #-}

import Database.Sqlite

printRows statement = do
  row <- step statement
  if row == Done then
    return ()
  else do
    col <- column statement 0
    print col
    printRows statement

main = do
  conn <- open "database.db"

  statement <- prepare conn "DROP TABLE IF EXISTS my_table;"
  step statement
  finalize statement

  statement <- prepare conn "CREATE TABLE IF NOT EXISTS my_table (name VARCHAR(20));"
  step statement
  finalize statement

  statement <- "INSERT INTO my_table(name) VALUES ('Kerningham');"
  step statement
  finalize statement

  statement <- "INSERT INTO my_table(name) VALUES ('Stroustrup');"
  step statement
  finalize statement

  statement <- "SELECT * FROM my_table;"
  printRows statement
  finalize statement

  close conn

