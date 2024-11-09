#include "RegisterHandler.h"
#include <drogon/HttpResponse.h>
#include <drogon/HttpRequest.h>
#include <bcrypt.h>
#include <iostream>
#include <memory>
#include <string>
#include "../db/Database.h"  // Your database utility header

void RegisterHandler::registerUser(
    const drogon::HttpRequestPtr &req,
    std::function<void(const drogon::HttpResponsePtr &)> &&callback)
{
    // Parse the registration form data (username and password)
    auto json = req->getJsonObject();
    std::string username = (*json)["username"].asString();
    std::string password = (*json)["password"].asString();

    // Hash the password using bcrypt
    std::string hashedPassword = bcrypt::generateHash(password);

    // Insert the user with hashed password into the database
    Database db;
    bool userCreated = db.createUser(username, hashedPassword);  // Assuming you have a method for that

    if (userCreated)
    {
        auto response = drogon::HttpResponse::newHttpResponse();
        response->setStatusCode(drogon::HttpStatusCode::k200OK);
        response->setBody("User created successfully");
        callback(response);
    }
    else
    {
        auto response = drogon::HttpResponse::newHttpResponse();
        response->setStatusCode(drogon::HttpStatusCode::k400BadRequest);
        response->setBody("User creation failed");
        callback(response);
    }
}
