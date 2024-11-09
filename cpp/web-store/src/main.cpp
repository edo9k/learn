#include <drogon/drogon.h>
#include "handlers/RegisterHandler.h"
#include "handlers/LoginHandler.h"

int main() {
    // Register routes
    drogon::app().registerHandler("/register",
                                  &RegisterHandler::registerUser);
    drogon::app().registerHandler("/login",
                                  &LoginHandler::loginUser);

    drogon::app().addListener("0.0.0.0", 8080);
    drogon::app().run();
}
