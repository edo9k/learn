#ifndef CONFIG_H
#define CONFIG_H

#include <string>

class Config {
public:
    // Singleton instance access
    static Config& instance();

    // Configuration getters
    std::string getDbConnectionString() const;
    std::string getJwtSecret() const;

private:
    // Constructor is private to prevent instantiation from outside
    Config();

    // Configuration variables
    std::string dbConnectionString;
    std::string jwtSecret;

    // Load the configuration settings
    void loadConfig();
};

#endif // CONFIG_H
