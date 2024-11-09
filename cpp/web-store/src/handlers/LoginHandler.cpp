#include "LoginHandler.h"
#include <drogon/HttpResponse.h>
#include <drogon/HttpRequest.h>
#include <bcrypt.h>
#include <iostream>
#include <memory>
#include <string>
#include "../db/Database.h"  // Your database utility header

void LoginHandler::loginUser(
    const drogon::HttpRequestPtr &req,
                          std::function<void(const drogon::HttpResponsePtr &)> &&callback)
                          {
    // Parse the login form data (username and password)
    auto json = req->getJsonObject();
    std::string username = (*json)["username"].asString();
    std::string password = (*json)["password"].asString();

    // Retrieve the stored hashed password from the database
    Database db;
    std::string storedHashedPassword = db.getHashedPasswordForUser(username);  // Assuming you have a method for that

    if (storedHashedPassword.empty())
    {
        auto response = drogon::HttpResponse::newHttpResponse();
        response->setStatusCode(drogon::HttpStatusCode::k404NotFound);
        response->setBody("User not found");
        callback(response);
        return;
    }

    // Verify the provided password with the stored hashed password
    if (bcrypt::validatePassword(password, storedHashedPassword))
    {
        auto response = drogon::HttpResponse::newHttpResponse();
        response->setStatusCode(drogon::HttpStatusCode::k200OK);
        response->setBody("Login successful");
        callback(response);
    }
    else
    {
        auto response = drogon::HttpResponse::newHttpResponse();
        response->setStatusCode(drogon::HttpStatusCode::k400BadRequest);
        response->setBody("Invalid username or password");
        callback(response);
    }
}
