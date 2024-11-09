et the database file path
DB_FILE="my_database.db"

# check if sqlite db file exists, other wite make one.

if [ ! -f "$DB_FILE" ]; then
  echo "SQLite db file not found. Creating $DB_FILE..."
  sqlite3 $DB_FILE "PRAGMA user_version;"  
else
  echo "Database file $DB_FILE already exists. Proceeding with table initialization..."
fi

# create the tables we need if there are not there already

sqlite3 $DB_FILE <<EOF
CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT UNIQUE NOT NULL,
    hashed_password TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS products (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    description TEXT,
    price REAL NOT NULL,
    stock INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS orders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);
EOF

echo "sqlite db ready -> $DB_FILE."

