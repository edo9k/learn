#ifndef USER_MODEL_H
#define USER_MODEL_H

#include <string>
#include <drogon/orm/DbClient.h>

class UserModel {
public:
    static bool createUser(const std::string &username, const std::string &password);
    static bool checkUserPassword(const std::string &username, const std::string &password);
};

#endif // USER_MODEL_H
