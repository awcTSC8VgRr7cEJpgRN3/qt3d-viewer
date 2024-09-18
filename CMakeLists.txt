# Copyright (C) 2022 The Qt Company Ltd.
# SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

cmake_minimum_required(VERSION 3.16)
project(qt3d-viewer LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)

find_package(Qt6 REQUIRED COMPONENTS
    Core
    Gui
    Quick
    # Quick3D
)

qt_add_executable(appqt3d-viewer
    main.cpp
)

set_target_properties(appqt3d-viewer PROPERTIES
    WIN32_EXECUTABLE TRUE
    MACOSX_BUNDLE TRUE
)

target_link_libraries(appqt3d-viewer PUBLIC
    Qt::Core
    Qt::Gui
    Qt::Quick
    # Qt::Quick3D
)

qt_add_qml_module(appqt3d-viewer
    URI Example
    VERSION 1.0
    QML_FILES main.qml
    NO_RESOURCE_TARGET_PATH
    QML_FILES DynamicModel.qml
    QML_FILES ThreeDimensionalScene.qml
    QML_FILES
    QML_FILES
    QML_FILES H3Elephant.qml
)

qt6_add_resources(appqt3d-viewer "appqt3d-viewer"
    PREFIX
        "/"
    FILES
        "assets/obj/Halo 3 Elephant_obj.obj"
)

install(TARGETS appqt3d-viewer
    BUNDLE  DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
)

qt_generate_deploy_qml_app_script(
    TARGET appqt3d-viewer
    OUTPUT_SCRIPT deploy_script
    MACOS_BUNDLE_POST_BUILD
    NO_UNSUPPORTED_PLATFORM_ERROR
    DEPLOY_USER_QML_MODULES_ON_UNSUPPORTED_PLATFORM
)
install(SCRIPT ${deploy_script})
