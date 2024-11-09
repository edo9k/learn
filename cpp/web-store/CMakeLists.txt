# CMakeLists.txt
cmake_minimum_required(VERSION 3.10)
project(MyCppWebApp)

# Specify C++ standard
set(CMAKE_CXX_STANDARD 17)

# Include Drogon
add_subdirectory(vendor/drogon)

# include bcrypt
include_directories(${PROJECT_SOURCE_DIR}/vendor/Bcrypt/include)

# Add the executable
add_executable(MyCppWebApp
    src/main.cpp
    src/handlers/RegisterHandler.cpp
    src/handlers/LoginHandler.cpp
    src/models/UserModel.cpp
    src/db/Database.cpp
    # Add other necessary .cpp files here
)

# Link Drogon to your executable
target_link_libraries(MyCppWebApp 
  PRIVATE drogon
  PRIVATE bcrypt)



