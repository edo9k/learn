#ifndef LOGIN_HANDLER_H
#define LOGIN_HANDLER_H

#include <drogon/HttpController.h>

class LoginHandler {
public:
    static void loginUser(const drogon::HttpRequestPtr &req,
                          std::function<void(const drogon::HttpResponsePtr &)> &&callback);
};

#endif // LOGIN_HANDLER_H
