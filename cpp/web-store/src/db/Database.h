#ifndef DATABASE_H
#define DATABASE_H

#include <string>
#include <sqlite3.h>

class Database {
public:
    Database();
    ~Database();

    bool createUser(const std::string &username, const std::string &hashedPassword);
    std::string getHashedPasswordForUser(const std::string &username);

private:
    sqlite3 *db;
};

#endif // DATABASE_H
