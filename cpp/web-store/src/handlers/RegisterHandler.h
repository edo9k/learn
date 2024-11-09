#ifndef REGISTER_HANDLER_H
#define REGISTER_HANDLER_H

#include <drogon/HttpController.h>

class RegisterHandler
{
public:
  static void registerUser(const drogon::HttpRequestPtr &req,
                           std::function<void(const drogon::HttpResponsePtr &)> &&callback);
};

#endif // REGISTER_HANDLER_H
