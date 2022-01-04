# Config.pri file version 2.0. Auto-generated by IDE. Any changes made by user will be lost!
BASEDIR = $$quote($$_PRO_FILE_PWD_)

device {
    CONFIG(debug, debug|release) {
        profile {
            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        } else {
            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }

    }

    CONFIG(release, debug|release) {
        !profile {
            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }
    }
}

simulator {
    CONFIG(debug, debug|release) {
        !profile {
            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }
    }
}

config_pri_assets {
    OTHER_FILES += \
        $$quote($$BASEDIR/assets/images/icons/ic_add.png) \
        $$quote($$BASEDIR/assets/images/icons/ic_add_subtract.png) \
        $$quote($$BASEDIR/assets/images/icons/ic_reload.png) \
        $$quote($$BASEDIR/assets/images/icons/ic_subtract.png) \
        $$quote($$BASEDIR/assets/images/splashscreens/splashscreen_1024x600.png) \
        $$quote($$BASEDIR/assets/images/splashscreens/splashscreen_1280x720.png) \
        $$quote($$BASEDIR/assets/images/splashscreens/splashscreen_1280x768.png) \
        $$quote($$BASEDIR/assets/images/splashscreens/splashscreen_1440x1440.png) \
        $$quote($$BASEDIR/assets/images/splashscreens/splashscreen_600x1024.png) \
        $$quote($$BASEDIR/assets/images/splashscreens/splashscreen_720x1280.png) \
        $$quote($$BASEDIR/assets/images/splashscreens/splashscreen_720x720.png) \
        $$quote($$BASEDIR/assets/images/splashscreens/splashscreen_768_1280.png) \
        $$quote($$BASEDIR/assets/views/counter.qml) \
        $$quote($$BASEDIR/assets/views/main.qml) \
        $$quote($$BASEDIR/assets/views/preferences.qml)
}

config_pri_source_group1 {
    SOURCES += \
        $$quote($$BASEDIR/src/applicationui.cpp) \
        $$quote($$BASEDIR/src/main.cpp) \
        $$quote($$BASEDIR/src/usrprefs.cpp)

    HEADERS += \
        $$quote($$BASEDIR/src/applicationui.hpp) \
        $$quote($$BASEDIR/src/usrprefs.hpp)
}

CONFIG += precompile_header

PRECOMPILED_HEADER = $$quote($$BASEDIR/precompiled.h)

lupdate_inclusion {
    SOURCES += \
        $$quote($$BASEDIR/../src/*.c) \
        $$quote($$BASEDIR/../src/*.c++) \
        $$quote($$BASEDIR/../src/*.cc) \
        $$quote($$BASEDIR/../src/*.cpp) \
        $$quote($$BASEDIR/../src/*.cxx) \
        $$quote($$BASEDIR/../assets/*.qml) \
        $$quote($$BASEDIR/../assets/*.js) \
        $$quote($$BASEDIR/../assets/*.qs) \
        $$quote($$BASEDIR/../assets/images/*.qml) \
        $$quote($$BASEDIR/../assets/images/*.js) \
        $$quote($$BASEDIR/../assets/images/*.qs) \
        $$quote($$BASEDIR/../assets/images/icons/*.qml) \
        $$quote($$BASEDIR/../assets/images/icons/*.js) \
        $$quote($$BASEDIR/../assets/images/icons/*.qs) \
        $$quote($$BASEDIR/../assets/images/splashscreens/*.qml) \
        $$quote($$BASEDIR/../assets/images/splashscreens/*.js) \
        $$quote($$BASEDIR/../assets/images/splashscreens/*.qs) \
        $$quote($$BASEDIR/../assets/views/*.qml) \
        $$quote($$BASEDIR/../assets/views/*.js) \
        $$quote($$BASEDIR/../assets/views/*.qs)

    HEADERS += \
        $$quote($$BASEDIR/../src/*.h) \
        $$quote($$BASEDIR/../src/*.h++) \
        $$quote($$BASEDIR/../src/*.hh) \
        $$quote($$BASEDIR/../src/*.hpp) \
        $$quote($$BASEDIR/../src/*.hxx)
}

TRANSLATIONS = $$quote($${TARGET}.ts)
