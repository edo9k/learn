#include "Config.h"
#include <fstream>
#include <nlohmann/json.hpp>

Config::Config() {
    loadConfig();
}

Config& Config::instance() {
    static Config instance;
    return instance;
}

void Config::loadConfig() {
    // For this example, we’ll load the configuration from a JSON file.
    // You can adjust it to load from a different source (like environment variables or a YAML file).
    
    std::ifstream configFile("config.json");
    if (configFile.is_open()) {
        nlohmann::json configJson;
        configFile >> configJson;

        // Set values from the config file (if present)
        dbConnectionString = configJson.value("db_connection_string", "default_db_connection_string");
        jwtSecret = configJson.value("jwt_secret", "default_jwt_secret");
    } else {
        // Handle error (could throw an exception or log the error)
        dbConnectionString = "default_db_connection_string";
        jwtSecret = "default_jwt_secret";
    }
}

std::string Config::getDbConnectionString() const {
    return dbConnectionString;
}

std::string Config::getJwtSecret() const {
    return jwtSecret;
}
