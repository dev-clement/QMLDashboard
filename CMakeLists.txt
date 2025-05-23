cmake_minimum_required(VERSION 3.16)

project(Dashboard VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)


qt_add_executable(appDashboard
    main.cpp
)

qt_add_qml_module(appDashboard
    URI Dashboard
    VERSION 1.0
    QML_FILES
        Main.qml
        Components/Sidebar/SidebarHeader.qml
        Components/Sidebar/SidebarFooter.qml
        Components/Sidebar/Sidebar.qml
        Components/Sidebar/SidebarList.qml
        Components/RightSide/BasePage.qml
        Components/RightSide/DashboardPage.qml
        Components/RightSide/GenericPage.qml
    RESOURCES
        resources.qrc
    SOURCES
        backendhelper.hpp
        backendhelper.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appDashboard PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appDashboard
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appDashboard
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appDashboard
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
