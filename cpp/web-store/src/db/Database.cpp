#include "Database.h"
#include <sqlite3.h>
#include <iostream>

Database::Database() {
    // Open the SQLite database
    if (sqlite3_open("my_database.db", &db)) {
        std::cerr << "Can't open database: " << sqlite3_errmsg(db) << std::endl;
    }
}

Database::~Database() {
    sqlite3_close(db);
}

bool Database::createUser(const std::string &username, const std::string &hashedPassword) {
    std::string sql = "INSERT INTO users (username, hashed_password) VALUES (?, ?)";

    sqlite3_stmt *stmt;
    if (sqlite3_prepare_v2(db, sql.c_str(), -1, &stmt, nullptr) != SQLITE_OK) {
        std::cerr << "Failed to prepare statement: " << sqlite3_errmsg(db) << std::endl;
        return false;
    }

    sqlite3_bind_text(stmt, 1, username.c_str(), -1, SQLITE_STATIC);
    sqlite3_bind_text(stmt, 2, hashedPassword.c_str(), -1, SQLITE_STATIC);

    if (sqlite3_step(stmt) != SQLITE_DONE) {
        std::cerr << "Execution failed: " << sqlite3_errmsg(db) << std::endl;
        sqlite3_finalize(stmt);
        return false;
    }

    sqlite3_finalize(stmt);
    return true;
}

std::string Database::getHashedPasswordForUser(const std::string &username) {
    std::string sql = "SELECT hashed_password FROM users WHERE username = ?";

    sqlite3_stmt *stmt;
    if (sqlite3_prepare_v2(db, sql.c_str(), -1, &stmt, nullptr) != SQLITE_OK) {
        std::cerr << "Failed to prepare statement: " << sqlite3_errmsg(db) << std::endl;
        return "";
    }

    sqlite3_bind_text(stmt, 1, username.c_str(), -1, SQLITE_STATIC);

    if (sqlite3_step(stmt) == SQLITE_ROW) {
        const char *hashedPassword = reinterpret_cast<const char *>(sqlite3_column_text(stmt, 0));
        std::string result = hashedPassword ? hashedPassword : "";
        sqlite3_finalize(stmt);
        return result;
    }

    sqlite3_finalize(stmt);
    return "";
}
