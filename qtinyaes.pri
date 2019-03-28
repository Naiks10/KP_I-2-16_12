HEADERS += \
	$$PWD/qtinyaes.h

SOURCES += \
	$$PWD/qtinyaes.cpp

INCLUDEPATH += $$PWD

QDEP_DEPENDS += Skycoder42/tiny-AES-C

!qdep_build {
	isEmpty(TINYAES_KEYSIZE): TINYAES_KEYSIZE = 256
	DEFINES += AES$${TINYAES_KEYSIZE}=1
}
