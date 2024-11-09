#include "UserModel.h"
#include <bcrypt.h>
#include <drogon/drogon.h>

bool UserModel::createUser(const std::string &username, const std::string &password) {
    std::string hashedPassword = bcrypt::generateHash(password);
    auto dbClient = drogon::app().getDbClient();
    dbClient->execSqlAsync("INSERT INTO users (username, password) VALUES (?, ?)",
        username, hashedPassword,
        [](const drogon::orm::Result &r) { return true; },
        [](const std::exception &e) { return false; });
    return true;
}

bool UserModel::checkUserPassword(const std::string &username, const std::string &password) {
    auto dbClient = drogon::app().getDbClient();
    dbClient->execSqlAsync("SELECT password FROM users WHERE username = ?",
        username,
        [password](const drogon::orm::Result &r) {
            if (r.empty()) return false;
            std::string storedHashedPassword = r[0]["password"].as<std::string>();
            return bcrypt::validatePassword(password, storedHashedPassword);
        },
        [](const std::exception &e) {
            return false;
        });
    return false;
}

